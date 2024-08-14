import 'package:firebase1/utlis/utils.dart';
import 'package:firebase1/widgets/round_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Forgot Pasword Screen',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Apply border radius here
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Apply border radius when focused
                  borderSide: BorderSide(
                    color: Colors.blue, // Set the border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Apply border radius when enabled
                  borderSide: BorderSide(
                    color: Colors.grey, // Set the border color when not focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            RoundButton(
                title: 'Forgot',
                onTap: (){
                  auth.sendPasswordResetEmail(email: emailController.text.toString() ).then((value){
                    Utils().toastMessage('We have send message to recover password,please check email');
                  }).onError((error, stackTrace){
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
