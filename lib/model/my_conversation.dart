import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstbd233/constante/constant.dart';

class MyConversation {
  late String uid;
  late String user1;
  late String user2;

  MyConversation() {
    uid = "";
    user1 = "";
    user2 = "";
  }

  MyConversation.bdd(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    myConversation = uid;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    user1 = map["USER1"];
    user2 = map["USER2"];
  }
}
