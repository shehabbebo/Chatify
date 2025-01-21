import 'package:Chatify/models/message.dart';
import 'package:Chatify/widgets/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<Message> messageslist = [];
  void sendMessage({required String message, required String email}) {
    try {
      messages
          .add({kMessage: message, kCreatedAt: DateTime.now(), 'id': email});
    } on Exception catch (e) {}
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageslist.clear();
      for (var doc in event.docs) {
        print('doc =${doc}');
        messageslist.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messageslist));
    });
  }
}
