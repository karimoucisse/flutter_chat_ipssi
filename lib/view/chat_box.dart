import 'package:flutter/material.dart';

import '../constante/constant.dart';
import '../controller/firebase_helper.dart';
import 'my_background.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.red,
          elevation: 0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        ),

        // extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            MyBackGroundPage(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    TextField(
                        controller: message,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.message),
                          hintText: "Entrer votre message",
                        )
                    ),
                    ElevatedButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).clearSnackBars();
                          //enregistrer dans la base de donnée
                          FirebaseHelper().createMessage(message.text);
                        },
                        child: Text("Enregistrement")
                    )
                  ],
                )

            )
          ],
        ));
  }
}
