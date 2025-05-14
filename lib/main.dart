import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:needai/presentation/screens/auth.dart';
import 'package:needai/presentation/screens/books.dart';

=======
import 'package:needai/presentation/screens/books.dart';
import 'package:needai/app.dart';
import 'package:needai/presentation/screens/auth.dart';
>>>>>>> db8cfb5d3b481fe56a8aa500aeb3f9942d04dbea
import 'package:needai/presentation/screens/courses.dart';
import 'package:needai/presentation/screens/favourites/favourites.dart';
import 'package:needai/presentation/screens/firstpage.dart';
import 'package:needai/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

<<<<<<< HEAD
  runApp(const MainApp());
}

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
=======
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
>>>>>>> db8cfb5d3b481fe56a8aa500aeb3f9942d04dbea
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return Authourization();
            }
          }

<<<<<<< HEAD
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
        ],
=======
          return Center(child: CircularProgressIndicator());
        },
>>>>>>> db8cfb5d3b481fe56a8aa500aeb3f9942d04dbea
      ),
    ),
  );
}
