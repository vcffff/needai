import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/courses.dart';
import 'package:needai/presentation/screens/firstpage.dart';
import 'package:needai/presentation/screens/firstpage/pages/bottom_bar.dart';
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
