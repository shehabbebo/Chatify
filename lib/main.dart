import 'package:Chatify/firebase_options.dart';
import 'package:Chatify/screens/chat.dart';
import 'package:Chatify/screens/cubits/Login_cubit/login_cubit.dart';
import 'package:Chatify/screens/cubits/chat/chat_cubit.dart';
import 'package:Chatify/screens/cubits/register_cubit/register_cubit_cubit.dart';
import 'package:Chatify/screens/login_page.dart';
import 'package:Chatify/screens/regester.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => LoginPage(),
          Regester.id: (context) => Regester(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: 'LoginPage',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
