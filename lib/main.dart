import 'package:Chatify/firebase_options.dart';
import 'package:Chatify/screens/blocs/auth_bloc/auth_bloc.dart';
import 'package:Chatify/screens/chat.dart';
import 'package:Chatify/screens/cubits/auth_cubit/auth_cubit.dart';
import 'package:Chatify/screens/cubits/chat/chat_cubit.dart';
import 'package:Chatify/screens/login_page.dart';
import 'package:Chatify/screens/regester.dart';
import 'package:Chatify/widgets/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (create) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
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
