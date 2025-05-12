import 'dart:ui';

class SearchFill {
  String? title;
  String? image;
  final Color colour;
  SearchFill({required this.title, required this.image, required this.colour});
}

class oneCourse {
  String? title;
  int? hours;
  String? type;
  List<CourseVideo> courseVideos;
  oneCourse({
    required this.title,
    required this.hours,
    this.type,
    required this.courseVideos,
  });
   Map<String, dynamic> toJson() => {
        'title': title,
        'hours': hours,
        'type': type,
        'courseVideos': courseVideos.map((v) => v.toJson).toList(),
      };

  factory oneCourse.fromJson(Map<String, dynamic> json) => oneCourse(
        title: json['title'],
        hours: json['hours'],
        type: json['type'],
        courseVideos: (json['courseVideos'] as List)
            .map((v) => CourseVideo.fromJson(v))
            .toList(),
      );
}

class CourseVideo {
  int? id;
  String? title;
  String? url;
  CourseVideo({required this.id, required this.title, required this.url});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
    };
  }

  factory CourseVideo.fromJson(Map<String, dynamic> json) {
    return CourseVideo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
    );
  }
}

List<oneCourse> originalCourses = [
  oneCourse(
   title: 'Physics',
    hours: 18,
    type: 'New',
    courseVideos: [
      CourseVideo(
        id: 0,
        title: 'First Law of Newton',
        url: 'https://youtu.be/1XSyyjcEHo0?si=srPQWGpWns92k_VE',
      ),
      CourseVideo(
        id: 1,
        title: 'Second Law of Newton',
        url: 'https://youtu.be/xzA6IBWUEDE?si=_thMwcmpcHXgvVW9',
      ),
      CourseVideo(
        id: 2,
        title: 'Second Law of Newton',
        url: 'https://youtu.be/y61_VPKH2B4?si=f8vC5QV16nPJyHh6',
      ),
    ],
  ),
  oneCourse(
    title: 'Math',
    hours: 20,
    type: 'Popular',
    courseVideos: [
      CourseVideo(
        id: 0,
        title: 'Kaprekar\'s constant',
        url: 'https://youtu.be/xtyNuOikdE4?si=TPiu3CMX9Khbc_Bv',
      ),
      CourseVideo(
        id: 1,
        title: 'Derivatives',
        url: 'https://youtu.be/N2PpRnFqnqY?si=Fg0e2mlyrvLCsZHE',
      ),
      CourseVideo(
        id: 2,
        title: 'Integral',
        url: 'https://youtu.be/nCx6FTChgow?si=4Wsa-5wr55G9CIen',
      ),
    ],
  ),
  oneCourse(
    title: 'English',
    hours: 15,
    type: 'New',
    courseVideos: [
      CourseVideo(
        id: 0,
        title: 'Kaprekar\'s constant',
        url: 'https://youtu.be/xtyNuOikdE4?si=TPiu3CMX9Khbc_Bv',
      ),
      CourseVideo(
        id: 1,
        title: 'Derivatives',
        url: 'https://youtu.be/N2PpRnFqnqY?si=Fg0e2mlyrvLCsZHE',
      ),
      CourseVideo(
        id: 2,
        title: 'Integral',
        url: 'https://youtu.be/nCx6FTChgow?si=4Wsa-5wr55G9CIen',
      ),
    ],
  ),
];
