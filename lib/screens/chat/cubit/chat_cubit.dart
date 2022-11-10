import 'package:chatapp/models/message_model.dart';
import 'package:chatapp/screens/chat/cubit/chat_states.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagesCollection);

  void sendMessage({required String message, required String email}) {
    messages.add({
      messageDocument: message,
      createdAtDocument: DateTime.now(),
      emailIdDocument: email,
    });
  }

  void getMessages() {
    messages
        .orderBy(createdAtDocument, descending: true)
        .snapshots()
        .listen((event) {
      List<Message> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
