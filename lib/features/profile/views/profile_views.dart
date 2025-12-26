import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/profile_controllers.dart';
import 'edit_profile.dart';

class ProfileView extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF003D4D),
        elevation: 0,
        centerTitle: true,
        actions: [

          IconButton(
            onPressed: () => Get.to(
              () => EditProfileView(),
            ),
            icon: const Icon(Icons.edit_note, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),

            const SizedBox(height: 20),

            _buildInfoList(),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Campus Statistics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003D4D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            _buildStatGrid(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    var user = controller.userData;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF003D4D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(user['image']!),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt,
                        color: Colors.white, size: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            user['name']!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            user['email']!,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 20),

          // রোল, সেমিস্টার, ডিপার্টমেন্ট বক্স
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _profileInfoRow(Icons.badge_outlined, "Roll: ${user['roll']}"),
                const Divider(color: Colors.white24),
                _profileInfoRow(Icons.school_outlined, user['semester']!),
                const Divider(color: Colors.white24),
                _profileInfoRow(Icons.account_tree_outlined, user['dept']!),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // মেইন এডিট প্রোফাইল বাটন (Option 2)
          SizedBox(
            width: 180,
            child: OutlinedButton.icon(
              onPressed: () => Get.to(
                () => EditProfileView(),
              ),
              icon: const Icon(Icons.edit, size: 16, color: Colors.white),
              label: const Text("Edit Profile",
                  style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white54),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void _showEditDialog(BuildContext context) {
  //   Get.defaultDialog(
  //     title: "Edit Profile",
  //     titleStyle: const TextStyle(fontWeight: FontWeight.bold),
  //     content: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: Column(
  //         children: [
  //           TextField(
  //               decoration: InputDecoration(
  //                   labelText: "Full Name",
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10)))),
  //           const SizedBox(height: 15),
  //           TextField(
  //               decoration: InputDecoration(
  //                   labelText: "Semester",
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10)))),
  //         ],
  //       ),
  //     ),
  //     textConfirm: "Save",
  //     confirmTextColor: Colors.white,
  //     buttonColor: const Color(0xFF003D4D),
  //     onConfirm: () => Get.back(),
  //   );
  // }

  Widget _profileInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  // ইনফরমেশন লিস্ট
  Widget _buildInfoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _infoTile(Icons.info_outline, "About Campus"),
          _infoTile(Icons.grid_view_outlined, "Our Departments"),
          _infoTile(Icons.person_search_outlined, "Instructor List"),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF003D4D)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }


  Widget _buildStatGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.1,
        children: [
          _statCard(Icons.school, "7", "Department"),
          _statCard(Icons.people, "45000+", "Students"),
          _statCard(Icons.person_pin_circle, "150+", "Instructors"),
          _statCard(Icons.emoji_events, "20+", "Years Excellence"),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 35, color: Colors.white),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}