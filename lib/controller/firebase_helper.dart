import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstbd233/model/my_message.dart';
import 'package:firstbd233/model/my_user.dart';

import '../constante/constant.dart';
import '../model/my_conversation.dart';

class FirebaseHelper {
  final auth = FirebaseAuth.instance;
  final cloud_users = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloud_conversations =
      FirebaseFirestore.instance.collection("CONVERSATIONS");
  final cloud_message = FirebaseFirestore.instance.collection("MESSAGE");
  final storage = FirebaseStorage.instance;

  //inscrire un utiisateur
  Future<MyUser> inscription(
      String nom, String prenom, String email, String password) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = credential.user!.uid;
    Map<String, dynamic> data = {
      "NOM": nom,
      "PRENOM": prenom,
      "EMAIL": email,
    };
    addUser(uid, data);
    return getUser(uid);
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot snapshot = await cloud_users.doc(uid).get();
    return MyUser.bdd(snapshot);
  }

  //ajouter un utilisateur dans la base de donnée
  addUser(String uid, Map<String, dynamic> data) {
    cloud_users.doc(uid).set(data);
  }

  //me connecter
  Future<MyUser> connexion(String email, String password) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    return getUser(uid);
  }

  //mise à jour d'un utilisateur
  updateUser(String uid, Map<String, dynamic> map) {
    cloud_users.doc(uid).update(map);
  }

  //stocker un fichier
  Future<String> stockage(String dossier, String uidUser, String nameFile,
      Uint8List datasFile) async {
    TaskSnapshot snapshot =
        await storage.ref("/$dossier/$uidUser/$nameFile").putData(datasFile);
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  Future<MyConversation> createConversation(user2Uid) async {
    String _id = moi.uid + user2Uid;
    Map<String, dynamic> data = {
      "_id": _id,
      "user1": moi.uid,
      "user2": user2Uid,
    };
    addConversation(_id, data);
    return getConversation(_id);
  }

  addConversation(String uid, Map<String, dynamic> data) {
    cloud_conversations.doc(uid).set(data);
  }

  Future<MyConversation> getConversation(String uid) async {
    DocumentSnapshot snapshot = await cloud_conversations.doc(uid).get();
    return MyConversation.bdd(snapshot);
  }


  Future<MyMessage> createMessage(text) async {
    // String _id = moi.uid + conversationId;
    Map<String, dynamic> data = {
      // "_id": _id,
      "userId": moi.uid,
      "text": text,
      "conversationID": myConversation._id,
      "sendAt": DateTime.now(),
    };
    return addMessage(data);
    // getConversation(_id);
  }

  addMessage(Map<String, dynamic> data) {
    cloud_message.doc().set(data);
  }

  // Future<MyConversation> getConversation(String uid) async {
  //   DocumentSnapshot snapshot = await cloud_conversations.doc(uid).get();
  //   return MyConversation.bdd(snapshot);
  // }
}
