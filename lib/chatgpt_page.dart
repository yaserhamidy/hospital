import 'package:flutter/material.dart';
class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Assestant",style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,),
    );
  }
}
