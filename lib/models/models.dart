import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class NewMessageData {
  final String text;
  final Timestamp createdAt;
  final String userId;
  final String username;
  final String userImage;

  NewMessageData({
    @required this.text,
    @required this.createdAt,
    @required this.userId,
    @required this.username,
    @required this.userImage,
  });

  Map<String, dynamic> toJson() => {
        'text': this.text,
        'createdAt': this.createdAt,
        'userId': this.userId,
        'username': this.username,
        'userImage': this.userImage,
      };

  factory NewMessageData.fromJson(Map<String, dynamic> jsonMessage) =>
      NewMessageData(
        text: jsonMessage['text'],
        createdAt: jsonMessage['createdAt'],
        userId: jsonMessage['userId'],
        username: jsonMessage['username'],
        userImage: jsonMessage['userImage'],
      );
}
