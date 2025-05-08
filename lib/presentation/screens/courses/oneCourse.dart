import 'package:flutter/material.dart';

class oneCourse {
  String? title;
  int? hours;

  oneCourse({required this.title, required this.hours});
}

List<oneCourse> originalCourses = [
  oneCourse(title: 'Physics', hours: 18),
  oneCourse(title: 'Math', hours: 20),
  oneCourse(title: 'English', hours: 15),
];

class OneCourse extends StatelessWidget {
  final oneCourse onecourse;

  const OneCourse({super.key, required this.onecourse});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                onecourse.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  '${onecourse.hours ?? 0} hours',
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
