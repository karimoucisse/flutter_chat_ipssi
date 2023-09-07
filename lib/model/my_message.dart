import 'package:cloud_firestore/cloud_firestore.dart';

class MyMesage {
  late String uid;
  late String text;
  late String userid;
  late String conversationId;
  late DateTime sendAt;

  MyMesage() {
    uid = "";
    text = "";
    userid = "";
    conversationId = "";
    sendAt = DateTime.now();
  }
}
