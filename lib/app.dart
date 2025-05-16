import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/auth/auth.dart';
import 'package:needai/presentation/screens/books_page/books.dart';
import 'package:needai/presentation/screens/courses/courses.dart';
import 'package:needai/presentation/screens/favourites/favourites.dart';
import 'package:needai/presentation/screens/firstpage/firstpage.dart';
import 'package:needai/presentation/screens/video_page/videos.dart';
import 'package:needai/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AddToFavourites())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current = 0;
  void changepage(int index) {
    setState(() {
      current = index;
    });
  }

  List<Widget> pages = [
    // Header Section
    Firstpage(),
    // White Card Section
    //books
    Books(),
    //list of cources
    Course(),

    //favourites
    FavoritesPage(),

    Center(child: Text('negr')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changepage,
        currentIndex: current,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.home, color: Colors.blueAccent),
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
            icon: Icon(CupertinoIcons.heart_fill, color: Colors.blueAccent),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueAccent,
            ),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'Chat'),
        ],
      ),
    );
  }
}
