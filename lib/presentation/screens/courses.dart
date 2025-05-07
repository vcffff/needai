import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/data/services/services.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

final List<SearchFill> searches = [
  SearchFill(
    title: "Languages",
    image: "assets/images/Vector (2).svg",
    color: Color.fromRGBO(206, 236, 254, 1),
  ),
  SearchFill(
    title: "Math",
    image: "assets/images/Vector (3).svg",
    color: Color.fromRGBO(239, 224, 255, 1),
  ),
];

class _CourseState extends State<Course> {
  final searchBarController = TextEditingController();
  Widget searchFillContainer(String label, String img, String colour) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(),
        child: Row(children: [Image.asset('assets/images/Vector (2).svg')]),
      ),
    );
  }

  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Course',
          style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person), iconSize: 60),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          padding: EdgeInsets.only(top: 20),
          child: TextField(
            controller: searchBarController,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color.fromRGBO(235, 235, 245, 0.6),
              contentPadding: EdgeInsets.symmetric(vertical: 2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.tune, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
