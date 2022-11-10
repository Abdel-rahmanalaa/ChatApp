import 'package:chatapp/models/message_model.dart';
import 'package:chatapp/screens/chat/cubit/chat_cubit.dart';
import 'package:chatapp/screens/chat/cubit/chat_states.dart';
import 'package:chatapp/shared/componets/consts/colors.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:chatapp/shared/componets/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {

     dynamic email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 2.5,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: const Text(
          chatText,
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state){
                if(state is ChatSuccess){
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    return messageList[index].emailId == email
                        ? chatBubble(message: messageList[index])
                        : chatBubbleForFriend(message: messageList[index]);
                  },
                );
              },
            ),
          ),
          Container(
            color: whiteColor,
            height: 110,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 28,
              ),
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  print('$email');
                  BlocProvider.of<ChatCubit>(context).sendMessage(message: data, email: email);
                  controller.clear();
                  _controller.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: backgroundTextFiledColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: backgroundColor,
                    ),
                  ),
                  hintText: hintText,
                  suffixIcon: const Icon(
                    Icons.send,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
