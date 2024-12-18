import 'package:Chatify/screens/chat.dart';
import 'package:Chatify/screens/cubits/Login_cubit/login_cubit.dart';
import 'package:Chatify/screens/regester.dart';
import 'package:Chatify/widgets/constants.dart';
import 'package:Chatify/widgets/custombuttom.dart';
import 'package:Chatify/widgets/customtextfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  String? email;
  String? password;
  bool isloading = false;
  static String id = 'login Page';

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isloading = false;
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
          isloading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/123.jpg',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome in Chatify',
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text('Login',
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomFormtextfiled(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomFormtextfiled(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'password',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Custombuttom(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .LoginUser(email: email!, password: password!);
                      } else {}
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Regester.id);
                        },
                        child: Text(
                          '  Regeter',
                          style: TextStyle(color: Color(0xffC7EDE6)),
                        ),
                      )
                    ],
                  ),
                  // Spacer(
                  //   flex: 3,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}


  // isloading = true;

  //                       try {
  //                         await LoginUser();
  //                         Navigator.pushNamed(context, ChatPage.id,
  //                             arguments: email);
  //                       } on FirebaseAuthException catch (ex) {
  //                         if (ex.code == 'user-not-found') {
  //                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                               content:
  //                                   Text('No user found for that email.')));
  //                         } else if (ex.code == 'wrong-password') {
  //                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                               content: Text(
  //                                   'Wrong password provided for that user.')));
  //                         } else {
  //                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                               content: Text(
  //                                   'An error occurred. Please try again.')));
  //                         }
  //                       } catch (ex) {
  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                             SnackBar(content: Text('There was an error')));
  //                       } finally {
  //                         isloading = false;
  //                       }
  //                     }
  //                   },