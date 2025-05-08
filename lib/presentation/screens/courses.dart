import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/courses/buttonGroup.dart';
import 'dart:ui';

import 'package:needai/presentation/screens/courses/searchFill.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final searchBarController = TextEditingController();

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Course',
          style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 40,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            const SizedBox(height: 12),
            SizedBox(height: 180, child: listView()),
            const SizedBox(height: 12),
            ButtonGroup(),
          ],
        ),
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: searches.length,
      itemBuilder: (context, index) {
        return SearchFillContainer(searchFill: searches[index]);
      },
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: searchBarController,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color.fromRGBO(235, 235, 245, 0.6),
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
