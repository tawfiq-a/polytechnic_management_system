import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/library_controller.dart';

class LibraryMainView extends StatelessWidget {
  final controller = Get.put(LibraryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Obx(
          () => Text(
            controller.selectedIndex.value == 0
                ? "Available Books"
                : controller.selectedIndex.value == 1
                ? "Borrow Request"
                : "Borrow History",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF003D4D),
        elevation: 0,
      ),

      endDrawer: _buildLibraryDrawer(),

      body: Obx(() {
        if (controller.selectedIndex.value == 0) return _buildAvailableBooks();
        if (controller.selectedIndex.value == 1) {
          return _buildBorrowRequestForm();
        }
        return _buildBorrowHistory();
      }),
    );
  }

  Widget _buildLibraryDrawer() {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF003D4D)),
            child: Center(
              child: Icon(Icons.library_books, size: 80, color: Colors.white),
            ),
          ),
          _drawerItem(0, Icons.menu_book, "Available Books"),
          _drawerItem(1, Icons.send_to_mobile, "Borrow Book Request"),
          _drawerItem(2, Icons.history, "Books Return & History"),
          const Spacer(),
          const Divider(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerItem(int index, IconData icon, String title) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return ListTile(
        selected: isSelected,
        selectedTileColor: const Color(0xFF003D4D).withOpacity(0.1),
        leading: Icon(
          icon,
          color: isSelected ? const Color(0xFF003D4D) : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFF003D4D) : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () => controller.changePage(index),
      );
    });
  }


  Widget _buildAvailableBooks() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search books...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: controller.books.length,
            itemBuilder: (context, index) {
              var book = controller.books[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        book['image']!,
                        height: 60,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            book['author']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: book['status'] == "Available"
                            ? const Color(0xFF003D4D)
                            : Colors.grey,
                        minimumSize: const Size(70, 30),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        elevation: 0,
                      ),
                      child: Text(
                        book['status'] == "Available" ? "Borrow" : "Out",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ২. Borrow Request Form
  Widget _buildBorrowRequestForm() {
    return SingleChildScrollView(

      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Request a Book",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003D4D),
            ),
          ),
          const SizedBox(height: 20),
          _inputLabel("Book Name"),
          _buildInput("Enter book title"),
          const SizedBox(height: 15),
          _inputLabel("Expected Return Date"),
          _buildInput("DD-MM-YYYY"),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003D4D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Submit Request",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Borrow History
  Widget _buildBorrowHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: controller.history.length,
      itemBuilder: (context, index) {
        var data = controller.history[index];
        bool isBorrowed = data['status'] == "Borrowed";
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade100),
          ),
          child: ListTile(
            leading: Icon(
              isBorrowed ? Icons.book_online : Icons.check_circle,
              color: isBorrowed ? Colors.orange : Colors.green,
            ),
            title: Text(
              data['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text(
              "Date: ${data['date']}",
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: (isBorrowed ? Colors.orange : Colors.green).withOpacity(
                  0.1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                data['status']!,
                style: TextStyle(
                  color: isBorrowed ? Colors.orange : Colors.green,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _inputLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
    ),
  );
  Widget _buildInput(String hint) => TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}
