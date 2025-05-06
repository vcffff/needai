import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/firstpage.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    );
  }
}
