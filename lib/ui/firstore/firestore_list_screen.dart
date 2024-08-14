import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase1/ui/auth/login_Screen.dart';
import 'package:firebase1/ui/posts/add_post.dart';
import 'package:firebase1/utlis/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'add_firestore_data.dart';

 class FireStoreScreen extends StatefulWidget {
   const FireStoreScreen({super.key});
 
   @override
   State<FireStoreScreen> createState() => _FireStoreScreenState();
 }
 
 class _FireStoreScreenState extends State<FireStoreScreen> {
   final auth =FirebaseAuth.instance;
   final editController = TextEditingController();
   final firetore =FirebaseFirestore.instance.collection('user').snapshots();
   CollectionReference ref = FirebaseFirestore.instance.collection('user');


   @override
   void initState() {
     // TODO: implement initState
     super.initState();

   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         centerTitle: true,
         backgroundColor: Colors.teal,
         title: Text('Firestore',style: TextStyle(color: Colors.white),),
         actions: [
           IconButton(onPressed: (){
             auth.signOut().then((value){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
             }).onError((error, stackTrace){
               Utils().toastMessage(error.toString());
             });
           },
               icon: Icon(Icons.logout_outlined,color: Colors.white,)),
           SizedBox(width: 10),
         ],
       ),

       body: Column(
         children: [
           SizedBox(height: 10,),
           // Expanded(child: StreamBuilder(
           //     stream: ref.onValue,
           //     builder: (context , AsyncSnapshot<DatabaseEvent> snapshot){
           //
           //       if(!snapshot.hasData){
           //         return CircularProgressIndicator();
           //       }else{
           //         Map<dynamic ,dynamic> map =snapshot.data!.snapshot.value as dynamic;
           //         List<dynamic> list =[];
           //         list.clear();
           //         list=map.values.toList();
           //         return ListView.builder(
           //           itemCount: snapshot.data!.snapshot.children.length,
           //           itemBuilder: (context, index){
           //             return ListTile(
           //               title: Text(list[index]['title']),
           //               subtitle: Text(list[index]['id']),
           //             );
           //           },
           //         );
           //       }
           //     }) ),
           StreamBuilder<QuerySnapshot>(
               stream: firetore,
               builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return CircularProgressIndicator();
                 }
                 if(snapshot.hasError){
                   return Text('Some Error');
                 }
                 return Expanded(
                   child: ListView.builder(
                       itemCount: snapshot.data!.docs.length,
                       itemBuilder: (context,index){
                         return ListTile(
                           onTap: (){

                             /////////////////////////////////////////////////////////////////////
                             // ref.doc(snapshot.data!.docs[index]['id'].toString()).update({
                             //   'title' : 'Noman Tariq'
                             // }).then((value){
                             //   Utils().toastMessage('Update Data');
                             // }).onError((error, stackTrace){
                             //   Utils().toastMessage(error.toString());
                             // });

                             ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                           },
                           title: Text(snapshot.data!.docs[index]['title'].toString()),
                           subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
                         );
                       }),
                 );
               })

         ],
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFirestoreDataScreen()));
       },
         child: Icon(Icons.add),
       ),
     );
   }
   Future<void> showMyDialogue(String title, String id) async {
     editController.text = title;
     return showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text('Update'),
           content: TextField(
             controller: editController,
             decoration: InputDecoration(
               hintText: 'Edit',
             ),
           ),
           actions: [
             TextButton(
               onPressed: () {
                 Navigator.pop(context);
               },
               child: Text('Cancel'),
             ),
             TextButton(
               onPressed: () {
                 Navigator.pop(context);

               },
               child: Text('Update'),
             ),
           ],
         );
       },
     );
   }
 }
 