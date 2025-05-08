import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/courses/oneCourse.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBar(),
              const SizedBox(height: 12),
              SizedBox(height: 180, child: listView()),
              const SizedBox(height: 12),
              ButtonGroup(),
              listViewCourse(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewCourse() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: onecourses.length,
      itemBuilder: (context, index) {
        return OneCourse(onecourse: onecourses[index]);
      },
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

class ButtonGroup extends StatefulWidget {
  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int selectedIndex = 0;

  final List<String> buttons = ["All", "New", "Popular"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            'Choice your course',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: List.generate(buttons.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedIndex == index ? Colors.blue : Colors.white,
                  foregroundColor:
                      selectedIndex == index ? Colors.white : Colors.black,
                ),
                child: Text(buttons[index]),
              ),
            );
          }),
        ),
      ],
    );
  }
}
