import 'package:firebase1/ui/auth/login_Screen.dart';
import 'package:firebase1/widgets/round_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utlis/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

// class _SignupScreenState extends State<SignupScreen> {
//   bool loading =false;
//   final _formKey =GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController =TextEditingController();
//
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   void login(){
//     setState(() {
//       loading=true;
//     });
//     _auth.createUserWithEmailAndPassword(
//         email: emailController.text.toString(),
//         password: passwordController.text.toString()).then((value){
//       setState(() {
//         loading=false;
//       });
//     }).onError((error, stackTrace){
//       Utils().toastMessage(error.toString());
//       setState(() {
//         loading=true;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.teal,
//           title: Center(child: Text('SignUp',style: TextStyle(color: Colors.white),)),
//         ),
//         backgroundColor: Colors.grey[200],
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           hintText: 'Email',
//                           labelText: 'Email',
//                           prefixIcon: Icon(Icons.email_outlined),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius here
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius when focused
//                             borderSide: BorderSide(
//                               color: Colors.blue, // Set the border color when focused
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius when enabled
//                             borderSide: BorderSide(
//                               color: Colors.grey, // Set the border color when not focused
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Email';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 10,),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           hintText: 'Password',
//                           labelText: 'Password',
//                           prefixIcon: Icon(Icons.lock_outline),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius here
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius when focused
//                             borderSide: BorderSide(
//                               color: Colors.blue, // Set the border color when focused
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20), // Apply border radius when enabled
//                             borderSide: BorderSide(
//                               color: Colors.grey, // Set the border color when not focused
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Password';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   )
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               RoundButton(
//                 title: 'Signup',
//                 loading: loading,
//                 onTap:(){
//                 if(_formKey.currentState!.validate()) {
//                   login();
//                 }
//               },
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Already have an account?'),
//                   TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (context)=>LoginScreen()
//                     ));
//                   }, child: Text('Login'))
//                 ],
//               )
//             ],
//           ),
//         )
//
//     );
//   }
// }

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  bool _obscurePassword = true; // Variable to track password visibility
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    _auth.createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    ).then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('SignUp', style: TextStyle(color: Colors.white)),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: _obscurePassword, // Control visibility
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            RoundButton(
              title: 'Signup',
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  signup();
                }
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
