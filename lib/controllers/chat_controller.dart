import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var messageList = <String>[].obs;

  void addMessage(String message) {
    messageList.add(message);
  }

  //SEND MESSAGE

  //RECEIVE MESSAGE
}
