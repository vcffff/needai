import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/screens/courses/oneCourse.dart';
import 'dart:ui';

import 'package:needai/presentation/screens/courses/searchFill.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final searchBarController = TextEditingController();
  List<oneCourse> displayedCourses = [];
  @override
  void initState() {
    super.initState();
    displayedCourses = List.from(originalCourses);
  }

  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  void searchCourse(String searchBarController) {
    final suggestions =
        originalCourses.where((onecourse) {
          final onecourseTitle = onecourse.title!.toLowerCase();
          final input = searchBarController.toLowerCase();
          return onecourseTitle.contains(input);
        }).toList();
    setState(() {
      displayedCourses = suggestions.isEmpty ? originalCourses : suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Course',
          style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 40,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              searchBar(),
              const SizedBox(height: 12),
              SizedBox(height: 100, child: listView()),
              const SizedBox(height: 12),
              ButtonGroup(),
              listViewCourse(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewCourse() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: displayedCourses.length,
      itemBuilder: (context, index) {
        return OneCourse(onecourse: displayedCourses[index]);
      },
    );
  }

  Widget listView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: searches.length,
      itemBuilder: (context, index) {
        return SearchFillContainer(searchFill: searches[index]);
      },
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: searchBarController,
        onChanged: searchCourse,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color.fromRGBO(235, 235, 245, 0.6),
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),

          suffixIcon: IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 500,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Search Filter',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [CategoryChooser(), hoursChoose()],
                          ),
                          SizedBox(height: 70),
                          buttons(),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.tune, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

Widget buttons() {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          height: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: FilledButton(
            onPressed: () {},
            child: Text('Clear'),
            style: FilledButton.styleFrom(
              foregroundColor: Colors.blue,

              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 14),
      Expanded(
        flex: 4,
        child: Container(
          height: 80,
          child: FilledButton(
            onPressed: () {},
            child: Text('Apply Filters'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class CategoryChooser extends StatefulWidget {
  const CategoryChooser({super.key});

  @override
  State<CategoryChooser> createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  final List<String> categories = [
    'Design',
    'Pointing',
    'Coding',
    'Music',
    'Visual Identity',
    'Mathematics',
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              categories.map((category) {
                return ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = selected ? category : null;
                    });
                  },
                  selectedColor: Colors.blue.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color:
                        selectedCategory == category
                            ? Colors.blue
                            : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color:
                          selectedCategory == category
                              ? Colors.blue
                              : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class hoursChoose extends StatefulWidget {
  const hoursChoose({super.key});

  @override
  State<hoursChoose> createState() => _hoursChooseState();
}

class _hoursChooseState extends State<hoursChoose> {
  @override
  final List<String> hours = [
    '3-8 hours',
    '8-12 hours',
    '12-15 hours',
    '15-19 hours',
  ];
  final List<String> selectedHours = [];
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          'Hours',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 15),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              hours.map((hour) {
                return ChoiceChip(
                  label: Text(hour),
                  selected: selectedHours.contains(hour),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedHours.add(hour);
                      } else {
                        selectedHours.remove(hour);
                      }
                    });
                  },
                  selectedColor: Colors.blue[400],
                  labelStyle: TextStyle(
                    color:
                        selectedHours.contains(hour)
                            ? Colors.white
                            : Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class ButtonGroup extends StatefulWidget {
  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int selectedIndex = 0;

  final List<String> buttons = ["All", "New", "Popular"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            'Choice your course',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: List.generate(buttons.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedIndex == index ? Colors.blue : Colors.white,
                  foregroundColor:
                      selectedIndex == index ? Colors.white : Colors.black,
                ),
                child: Text(buttons[index]),
              ),
            );
          }),
        ),
      ],
    );
  }
}
