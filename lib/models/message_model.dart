import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String emailId;
  final Timestamp createdAT;
  Message(
    this.text,
    this.emailId,
      this.createdAT,
  );

  factory Message.fromJson(jsonData){

    return Message(
      jsonData[messageDocument],
      jsonData[emailIdDocument],
      jsonData[createdAtDocument],
    );
  }
}
