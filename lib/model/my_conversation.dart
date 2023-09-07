import 'package:cloud_firestore/cloud_firestore.dart';

class MyConversation {
  late String _id;
  late String user1;
  late String user2;

  MyConversation() {
    _id = "";
    user1 = "";
    user2 = "";
  }

  MyConversation.bdd(DocumentSnapshot snapshot) {
    // _id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    user1 = map["USER1"];
    user2 = map["USER2"];
  }
}
