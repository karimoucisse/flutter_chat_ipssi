import 'package:cloud_firestore/cloud_firestore.dart';

class MyMessage {
  late String _id;
  late String text;
  late String userid;
  late String conversationId;
  late DateTime sendAt;

  MyMessage() {
    _id = "";
    text = "";
    userid = "";
    conversationId = "";
    sendAt = DateTime.now();
  }

  MyMessage.bdd(DocumentSnapshot snapshot) {
    _id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    text = map["TEXT"];
    userid = map["USERID"];
    conversationId = map["CONVERSATIONID"];
    conversationId = map["CONVERSATIONID"];
    sendAt = map["SENDAT"];
  }
}
