import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: InkWell(
              onTap: () {},
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.home, color: Colors.blueAccent),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Course',
            icon: Icon(CupertinoIcons.book, color: Colors.blueAccent),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(CupertinoIcons.search, color: Colors.blueAccent),
          ),
          BottomNavigationBarItem(
            label: 'Message',
            icon: Icon(
              CupertinoIcons.conversation_bubble,
              color: Colors.blueAccent,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueAccent,
            ),
          ),
        ],
      );
  }
}