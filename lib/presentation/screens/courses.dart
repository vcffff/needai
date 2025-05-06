import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Course'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
    );
  }
}
