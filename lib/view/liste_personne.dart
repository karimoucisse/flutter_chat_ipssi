import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstbd233/controller/firebase_helper.dart';
import 'package:firstbd233/model/my_user.dart';
import 'package:flutter/material.dart';

import 'chat_box.dart';

class ListPersonne extends StatefulWidget {
  const ListPersonne({super.key});

  @override
  State<ListPersonne> createState() => _ListPersonneState();
}

class _ListPersonneState extends State<ListPersonne> {
  // createConversation
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseHelper().cloud_users.snapshots(),
        builder: (context, snap) {
          if (snap.data == null) {
            return Center(
              child: Text("Aucun utilisateur"),
            );
          } else {
            List documents = snap.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  MyUser users = MyUser.bdd(documents[index]);
                  return GestureDetector(
                      onTap: () {
                        FirebaseHelper().createConversation(users.uid);
                         Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return ChatBox();
                          }
                      ));
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.purple,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(users.avatar!),
                          ),
                          title: Text(users.fullName),
                          subtitle: Text(users.email),
                          trailing: Icon(Icons.favorite),
                        ),
                      ));
                });
          }
        });
  }
}
