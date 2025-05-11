import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/courses.dart';
import 'package:needai/presentation/screens/firstpage.dart';
<<<<<<< HEAD
import 'package:needai/presentation/screens/second.dart';
=======
import 'package:needai/presentation/screens/firstpage/pages/bottom_bar.dart';
>>>>>>> e1fd56862298340cf1ba6e813877214dbf432652
import 'firebase_options.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: MainPage(),
=======
>>>>>>> e1fd56862298340cf1ba6e813877214dbf432652
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: pageIndexNotifier,
          builder: (context, pageIndex, _) {
            switch (pageIndex) {
              case 0:
                return const Firstpage();
              case 1:
                return const Course();
              default:
                return const Firstpage();
            }
          },
        ),
        bottomNavigationBar: const BottomBar(),
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
    Secondpage(),

    //list of lessons
    Course(),
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
      ),
    );
  }
}
