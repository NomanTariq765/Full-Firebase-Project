import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase1/utlis/utils.dart';
import 'package:firebase1/widgets/round_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {


  final postController =TextEditingController();
  bool loading = false ;
  final firetore =FirebaseFirestore.instance.collection('user');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Add Firestore Data',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?' ,
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true ;
                  });
                  String id =DateTime.now().millisecondsSinceEpoch.toString();
                  firetore.doc(id).set({
                    'title' : postController.text.toString(),
                    'id' : id
                  }).then((value){
                    setState(() {
                      loading = false ;
                    });
                    Utils().toastMessage('Post Added');
                  }).onError((error, stackTrace){
                    setState(() {
                      loading = false ;
                    });
                    Utils().toastMessage(error.toString());
                  });

                })
          ],
        ),
      ),
    );
  }
}
