import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/chat_controller.dart';

class ChatRoomDetail extends StatelessWidget {
  final String title;
  ChatRoomDetail({super.key, required this.title});
  final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF003D4D),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(15),
                itemCount: controller.currentMessages.length,
                itemBuilder: (context, index) {
                  var msg = controller.currentMessages[index];
                  bool isMe = msg['isMe'] as bool;
                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe
                            ? const Color(0xFF003D4D)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        msg['text'] as String,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.messageController,
              decoration: const InputDecoration(
                hintText: "Type message...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: controller.sendMessage,
            icon: const Icon(Icons.send, color: Color(0xFF003D4D)),
          ),
        ],
      ),
    );
  }
}