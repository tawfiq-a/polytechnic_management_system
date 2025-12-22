import 'package:flutter/material.dart';

import 'base/custom_drawer.dart';

class LibraryManagement extends StatefulWidget {
  const LibraryManagement({super.key});

  @override
  State<LibraryManagement> createState() => _LibraryManagement();
}

class _LibraryManagement extends State<LibraryManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library Management"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
