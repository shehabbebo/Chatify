import 'package:Chatify/models/message.dart';
import 'package:Chatify/screens/cubits/chat/chat_cubit.dart';
import 'package:Chatify/widgets/ChatBuble.dart';
import 'package:Chatify/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final ScrollController _controller = ScrollController();
  List<Message> messageslist = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            klogo,
            height: 50,
          ),
          const Text('Chat'),
        ]),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messageslist =
                  BlocProvider.of<ChatCubit>(context).messageslist;
              return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageslist.length,
                  itemBuilder: (context, indx) {
                    return messageslist[indx].id == email
                        ? Chatbuble(
                            message: messageslist[indx],
                          )
                        : ChatbubleForFriend(message: messageslist[indx]);
                  });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onSubmitted: (data) {
              controller.clear();
              _controller.animateTo(
                0,
                // _controller.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
            decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimaryColor))),
          ),
        ),
      ]),
    );
  }
}
