import 'package:flutter/material.dart';
import 'package:poly_manage_systm/features/library_management/views/return_screen.dart';
import 'package:poly_manage_systm/features/library_management/views/student_management_screen.dart';
import '../../../core/constants/colors.dart';
import 'Category/add_department_screen.dart';
import 'Category/add_semester_screen.dart';
import 'IssueScreen.dart';
import 'base/CustomDrawer.dart';
import 'base/custom_add_book_bottom_sheet.dart';
import 'base/custom_edit_book_bottom_sheet.dart';

class LibraryManagement extends StatefulWidget {
  const LibraryManagement({super.key});

  @override
  State<LibraryManagement> createState() => _LibraryManagementState();
}

class _LibraryManagementState extends State<LibraryManagement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  final List<Map<String, String>> books = [
    {'title': 'Physics -II', 'code': '28545', 'copies': '100', 'dept': 'CST', 'sem': '7th'},
    {'title': 'Mathematics-III', 'code': '28545', 'copies': '264', 'dept': 'ENT', 'sem': '3rd'},
    {'title': 'Python Programming', 'code': '28545', 'copies': '150', 'dept': 'CST', 'sem': '6th'},
    {'title': 'Mathematics-III', 'code': '28545', 'copies': '264', 'dept': 'ENT', 'sem': '3rd'},
    {'title': 'Graphics Design-I', 'code': '28545', 'copies': '48', 'dept': 'ET', 'sem': '5th'},
    {'title': 'Python Programming', 'code': '28545', 'copies': '150', 'dept': 'CST', 'sem': '6th'},
    {'title': 'Mathematics-III', 'code': '28545', 'copies': '264', 'dept': 'ENT', 'sem': '3rd'},
    {'title': 'Python Programming', 'code': '28545', 'copies': '150', 'dept': 'CST', 'sem': '6th'},
  ];

  Widget _buildBody() {
    switch (selectedIndex) {
      case 0:
        return _bookListScreen();
      case 10:
        return _addBookScreen();
      case 11:
        return _editBookScreen();
      case 1: return IssueScreen();
      case 2: return ReturnScreen();
      case 12: return AddDepartmentScreen();
      case 13: return AddSemesterScreen();
      case 3: return StudentManagementScreen();
      default:
        return const Center(child: Text("Coming Soon..."));
    }
  }

  Widget _bookListScreen() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (_, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(book['title']!),
              subtitle: Text(
                  'Code: ${book['code']} | Copies: ${book['copies']} | Dept: ${book['dept']} | Semester: ${book['sem']}'),
            ),
          );
        },
      ),
    );
  }

  Widget _addBookScreen() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Books...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (_) => AddBookBottomSheet(
                      onAdd: (newBook) {
                        setState(() => books.add(newBook));
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Book', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (_, index) {
                final book = books[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(book['title']!),
                    subtitle: Text(
                        'Code: ${book['code']} | Copies: ${book['copies']} | Dept: ${book['dept']} | Semester: ${book['sem']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _editBookScreen() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (_, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(book['title']!),
              subtitle: Text(
                  'Code: ${book['code']} | Copies: ${book['copies']} | Dept: ${book['dept']} | Semester: ${book['sem']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (_) => EditBookBottomSheet(
                          book: book,
                          onUpdate: (updatedBook) {
                            setState(() => books[index] = updatedBook);
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Delete Book"),
                          content: Text("Are you sure you want to delete '${book['title']}'?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel",style: TextStyle(color: Colors.black),),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                              onPressed: () {
                                setState(() => books.removeAt(index));
                                Navigator.pop(context);
                              },
                              child: const Text("Delete",style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text('Library Management', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: CustomDrawer(
        scaffoldKey: _scaffoldKey,
        selectedIndex: selectedIndex,
        onItemSelected: (index) => setState(() => selectedIndex = index),
      ),
      body: _buildBody(),
    );
  }
}
