import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/chat_controller.dart';
import 'chat_screen.dart';

class ChatInboxView extends GetView<ChatController> {
  const ChatInboxView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text(
          "Chat ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        children: [

          _buildCustomTabSwitcher(),


          Expanded(
            child: Obx(() {
              return controller.selectedTab.value == 0
                  ? _buildInboxList()
                  : _buildDepartmentList();
            }),
          ),
        ],
      ),
    );
  }


  Widget _buildCustomTabSwitcher() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _tabItem(0, "Messages", Icons.chat_bubble_outline),
          _tabItem(1, "Dept Groups", Icons.groups_outlined),
        ],
      ),
    );
  }

  Widget _tabItem(int index, String title, IconData icon) {
    return Expanded(
      child: Obx(() {
        // Obx অবশ্যই এখানে থাকতে হবে যাতে ভ্যালু চেঞ্জ হলে সাথে সাথে UI আপডেট হয়
        bool isSelected = controller.selectedTab.value == index;

        return GestureDetector(
          onTap: () => controller.selectedTab.value = index,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF003D4D) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


  Widget _buildInboxList() {
    return ListView.separated(
      itemCount: controller.userList.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, indent: 80),
      itemBuilder: (context, index) {
        var user = controller.userList[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(user['image'] as String),
          ),
          title: Text(
            user['name'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            user['lastMsg'] as String,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13),
          ),
          trailing: Text(
            user['time'] as String,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          onTap: () =>
              Get.to(() => ChatRoomDetail(title: user['name'] as String)),
        );
      },
    );
  }


  Widget _buildDepartmentList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: controller.departments.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF003D4D),
              child: Icon(Icons.account_balance, color: Colors.white, size: 20),
            ),
            title: Text(
              controller.departments[index],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey,
            ),
            onTap: () => _showSemesterSelection(controller.departments[index]),
          ),
        );
      },
    );
  }


  void _showSemesterSelection(String deptName) {
    Get.to(
      () => Scaffold(
        appBar: AppBar(
          title: Text("$deptName Groups", style: const TextStyle(fontSize: 16)),
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.semesters.length,
          itemBuilder: (context, index) {
            return Container(
              // margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ListTile(
                leading: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  controller.semesters[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                trailing: const Icon(
                  Icons.chat,
                  color: Color(0xFF003D4D),
                  size: 20,
                ),
                onTap: () => Get.to(
                  () => ChatRoomDetail(
                    title: "$deptName - ${controller.semesters[index]}",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


