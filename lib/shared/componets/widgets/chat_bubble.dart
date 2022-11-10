import 'package:chatapp/models/message_model.dart';
import 'package:chatapp/shared/componets/consts/colors.dart';
import 'package:flutter/material.dart';

class chatBubble extends StatelessWidget {

  final Message message;

  chatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: whiteColor,
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: blackColor,
          ),
        ),
      ),
    );
  }
}

class chatBubbleForFriend extends StatelessWidget {

  final Message message;

  chatBubbleForFriend({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: primaryColor,
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}