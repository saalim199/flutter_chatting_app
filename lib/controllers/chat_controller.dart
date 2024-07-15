import 'package:chatting_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    MessageModel newMessage = MessageModel(
        message: message,
        senderId: _auth.currentUser!.uid,
        receiverId: receiverId,
        timestamp: Timestamp.now());

    List<String> ids = [newMessage.senderId, newMessage.receiverId];
    ids.sort();
    String chatId = ids.join("_");
    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(newMessage.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  //RECEIVE MESSAGE
  Stream<List<MessageModel>> getMessages(String receiverId) {
    List<String> ids = [_auth.currentUser!.uid, receiverId];
    ids.sort();
    String chatId = ids.join("_");
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MessageModel> retVal = [];
      for (DocumentSnapshot message in query.docs) {
        retVal
            .add(MessageModel.fromJson(message.data() as Map<String, dynamic>));
      }
      return retVal;
    });
  }
}
