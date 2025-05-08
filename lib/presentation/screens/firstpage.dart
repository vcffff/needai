import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:needai/presentation/screens/firstpage/pages/bottom_bar.dart';
import 'package:needai/presentation/screens/firstpage/pages/footer.dart';
import 'package:needai/presentation/screens/firstpage/pages/header.dart';
import 'package:needai/presentation/screens/firstpage/pages/justrow.dart';
import 'package:needai/presentation/screens/firstpage/pages/learning.dart';
import 'package:needai/presentation/screens/firstpage/pages/list.dart';
import 'package:needai/presentation/screens/firstpage/pages/settings_animation.dart';
import 'package:needai/presentation/screens/firstpage/pages/white_card.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage>
    with SingleTickerProviderStateMixin {
  late ProgressAnimation progressAnimation;
  @override
  void initState() {
    super.initState();
    progressAnimation = ProgressAnimation(
      vsync: this,
      onUpdate: () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    progressAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Header(),
              // White Card Section
              WhiteCard(),
              //list of lessons
              Listdart(),
              //progress
              Learningd(),
              //just learning page
              Justrow(),
              //meetup(footerpage)
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
