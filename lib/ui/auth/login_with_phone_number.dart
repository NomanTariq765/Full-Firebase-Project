
import 'package:firebase1/ui/auth/verify_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utlis/utils.dart';
import '../../widgets/round_buttons.dart';

  class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  bool loading = false ;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Login',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: '+92 313 1111 111',
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
              SizedBox(height: 30,),
              RoundButton(title: 'Login',loading: loading, onTap: (){

                setState(() {
                  loading = true ;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_){
                      setState(() {
                        loading = false ;
                      });
                    },
                    verificationFailed: (e){
                      setState(() {
                        loading = false ;
                      });
                      Utils().toastMessage(e.toString());
                    },
                    codeSent: (String verificationId , int? token){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(verificationId:verificationId ,)));
                      setState(() {
                        loading = false ;
                      });
                    },
                    codeAutoRetrievalTimeout: (e){
                      Utils().toastMessage(e.toString());
                      setState(() {
                        loading = false ;
                      });
                    });
              })

            ],
          ),
        ),
      ),
    );
  }
}