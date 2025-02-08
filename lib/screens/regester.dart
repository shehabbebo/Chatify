import 'package:Chatify/screens/chat.dart';
import 'package:Chatify/screens/cubits/auth_cubit/auth_cubit.dart';
import 'package:Chatify/widgets/constants.dart';
import 'package:Chatify/widgets/custombuttom.dart';
import 'package:Chatify/widgets/customtextfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Regester extends StatelessWidget {
  String? email;

  String? password;
  static String id = 'regester';
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isloading = false;
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        Text('Regester',
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormtextfiled(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormtextfiled(
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
                          BlocProvider.of<AuthCubit>(context)
                              .registerUser(email: email!, password: password!);
                        } else {}
                      },
                      text: 'Regester',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'alaready have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              '  Login',
                              style: TextStyle(color: Color(0xffC7EDE6)),
                            ))
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
        );
      },
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
