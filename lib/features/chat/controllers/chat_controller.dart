import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  var userList = [
    {
      "name": "Wilson Admin",
      "lastMsg": "Routine sent!",
      "time": "10:30 AM",
      "image": "https://i.pravatar.cc/150?u=1",
      "online": true,
    },
    {
      "name": "Atikur Rahman",
      "lastMsg": "Can you help me?",
      "time": "09:15 AM",
      "image": "https://i.pravatar.cc/150?u=2",
      "online": false,
    },
    {
      "name": "Instructor Sifat",
      "lastMsg": "Check your portal.",
      "time": "Yesterday",
      "image": "https://i.pravatar.cc/150?u=3",
      "online": true,
    },
    {
      "name": "Kamrul Islam",
      "lastMsg": "Thanks!",
      "time": "Monday",
      "image": "https://i.pravatar.cc/150?u=4",
      "online": false,
    },
  ].obs;


  var currentMessages = [
    {"text": "Hello! How can I help?", "isMe": false, "time": "10:00 AM"},
    {"text": "I need the exam routine.", "isMe": true, "time": "10:05 AM"},
    {
      "text": "Sure, I'll send it to you shortly.",
      "isMe": false,
      "time": "10:06 AM",
    },
  ].obs;


  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      currentMessages.add({
        "text": messageController.text.trim(),
        "isMe": true,
        "time": "Just now",
      });
      messageController.clear();


      Future.delayed(const Duration(milliseconds: 100), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }
}
