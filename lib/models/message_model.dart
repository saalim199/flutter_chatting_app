import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderId;
  final String receiverId;
  final Timestamp timestamp;

  MessageModel(
      {required this.message,
      required this.senderId,
      required this.receiverId,
      required this.timestamp});

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
    };
  }
}
