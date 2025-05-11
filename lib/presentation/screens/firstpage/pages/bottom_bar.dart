import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:needai/main.dart'; // Import the notifier

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndexNotifier.value,
      onTap: (int index) {
        pageIndexNotifier.value = index;
      },
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(
          label: 'Course',
          icon: Icon(CupertinoIcons.book),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          label: 'Message',
          icon: Icon(CupertinoIcons.conversation_bubble),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(CupertinoIcons.profile_circled),
        ),
      ],
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
    );
  }
}
