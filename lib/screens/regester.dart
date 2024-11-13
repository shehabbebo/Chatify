import 'package:Chatify/screens/chat.dart';
import 'package:Chatify/widgets/constants.dart';
import 'package:Chatify/widgets/custombuttom.dart';
import 'package:Chatify/widgets/customtextfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Regester extends StatefulWidget {
  Regester({super.key});
  static String id = 'regester';

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 32, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Text('Regester',
                        style: TextStyle(fontSize: 32, color: Colors.white)),
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
                      isloading = true;
                      setState(() {});
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('The password provided is too weak')));
                        } else if (ex.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'The account already exists for that email.')));
                        }
                      } catch (ex) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(' there was an error')));
                      }
                      isloading = false;
                      setState(() {});
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
  }
}
