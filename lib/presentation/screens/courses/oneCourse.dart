import 'package:flutter/material.dart';

class oneCourse {
  final String? title;
  final int? hours;

  oneCourse({required this.title, required this.hours});
}

final List<oneCourse> onecourses = [
  oneCourse(title: 'Physics', hours: 18),
  oneCourse(title: 'Math', hours: 20),
  oneCourse(title: 'English', hours: 15),
];

class OneCourse extends StatelessWidget {
  final oneCourse onecourse;

  const OneCourse({super.key, required this.onecourse});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onecourse.title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.amber[300]),
                  child: Text(
                    '${onecourse.hours!}',
                    style: TextStyle(color: Colors.amber[600]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
