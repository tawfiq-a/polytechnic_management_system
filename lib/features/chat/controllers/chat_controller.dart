import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // ট্যাব চেঞ্জ করার জন্য (০ = Inbox, ১ = Groups)
  var selectedTab = 0.obs;

  // ডিপার্টমেন্ট লিস্ট (৭টি)
  final List<String> departments = [
    "Computer (CST)", "Electrical", "Mechanical", "Civil", "Electronics", "RAC", "Electro-medical"
  ];

  // সেমিস্টার লিস্ট (৮টি)
  final List<String> semesters = [
    "1st Semester", "2nd Semester", "3rd Semester", "4th Semester",
    "5th Semester", "6th Semester", "7th Semester", "8th Semester"
  ];

  // ইউজার লিস্ট (Inbox)
  var userList = [
    {"name": "Wilson Admin", "lastMsg": "Routine sent!", "time": "10:30 AM", "image": "https://i.pravatar.cc/150?u=1", "online": true},
    {"name": "Atikur Rahman", "lastMsg": "Can you help me?", "time": "09:15 AM", "image": "https://i.pravatar.cc/150?u=2", "online": false},
    {"name": "Instructor Sifat", "lastMsg": "Check your portal.", "time": "Yesterday", "image": "https://i.pravatar.cc/150?u=3", "online": true},
  ].obs;

  var currentMessages = [
    {"text": "Hello! How can I help?", "isMe": false, "time": "10:00 AM"},
    {"text": "I need the exam routine.", "isMe": true, "time": "10:05 AM"},
  ].obs;

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      currentMessages.add({"text": messageController.text.trim(), "isMe": true, "time": "Just now"});
      messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }
}