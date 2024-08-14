import 'package:firebase1/ui/auth/signup_screen.dart';
import 'package:firebase1/ui/forgot_password.dart';
import 'package:firebase1/utlis/utils.dart';
import 'package:firebase1/widgets/round_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../posts/post_screen.dart';
import 'login_with_phone_number.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
//
//   bool loading =false;
//   final _formKey =GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController =TextEditingController();
//   final _auth = FirebaseAuth.instance;
//
//
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
//       loading =true;
//     });
//     _auth.signInWithEmailAndPassword(
//         email: emailController.text.toString(),
//         password: passwordController.text.toString()).then((value){
//           Utils().toastMessage(value.user!.email.toString());
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context)=>PostScreen())
//           );
//           setState(() {
//             loading =false;
//           });
//     }).onError((error, stackTrace){
//       debugPrint(error.toString());
//       Utils().toastMessage(error.toString());
//       setState(() {
//         loading =false;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: ()async{
//         SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.teal,
//           title: Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
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
//                       )
//
//                     ],
//                   )
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RoundButton(
//                 title: 'Login',
//                 loading:  loading,
//                 onTap:(){
//                   if(_formKey.currentState!.validate()){
//                     login();
//                   }
//               },
//               ),
//
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: TextButton(onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(
//                           builder: (context)=>ForgotPasswordScreen()
//                       ));
//                     },
//                         child: Text('Forgot Password?')),
//                   ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Dont have an account?'),
//                   TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (context)=>SignupScreen()
//                     ));
//                   }, child: Text('Sign up'))
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithPhoneNumber()));
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.black)
//                   ),
//                   child: Center(
//                     child: Text('Login with phone number',style: TextStyle(color: Colors.white),),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  bool _obscurePassword = true; // Variable to track password visibility
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    ).then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostScreen()),
      );
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
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
                      obscureText: _obscurePassword, // Use the variable to control visibility
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
              SizedBox(height: 20),
              RoundButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWithPhoneNumber(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Login with phone number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

