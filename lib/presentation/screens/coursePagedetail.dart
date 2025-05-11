import 'package:flutter/material.dart';
import 'package:needai/data/services/services.dart';

class CoursePage extends StatefulWidget {
  final oneCourse onecourse;

  const CoursePage({super.key, required this.onecourse});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                Text(
                  widget.onecourse.title!,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.amber[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${widget.onecourse.hours} Hours',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 153, 66, 0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.onecourse.courseVideos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    oneVideo(courseVideo: widget.onecourse.courseVideos[index]),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 100),
                ),
                onPressed: () {
                  
                },
                child: Icon(Icons.star_outline_rounded, size: 60),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 100),
                ),
                onPressed: () {},
                child: Text('Start Course!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class oneVideo extends StatelessWidget {
  final CourseVideo courseVideo;
  const oneVideo({super.key, required this.courseVideo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                '0${courseVideo.id! + 1}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                courseVideo.title!,
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_outline_rounded,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
