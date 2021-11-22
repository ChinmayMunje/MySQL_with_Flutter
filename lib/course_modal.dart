import 'package:mongo_dart/mongo_dart.dart';

class Course {
  late final ObjectId id;
  late final String courseName;
  late final String coursePrice;
  late final String courseDuration;
  late final String courseImg;
  late final String courseLink;

  Course(
      {required this.id,
      required this.courseName,
      required this.coursePrice,
      required this.courseDuration,
      required this.courseImg,
      required this.courseLink});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'courseName': courseName,
      'courseDuration': courseDuration,
      'coursePrice': coursePrice,
      'courseImg': courseImg,
      'courseUrl': courseLink,
    };
  }

  Course.fromMap(Map<String, dynamic> map)
      : courseName = map['courseName'],
        id = map['_id'],
        courseDuration = map['courseDuration'],
        courseLink = map['courseUrl'],
        coursePrice = map['coursePrice'],
        courseImg = map['courseImg'];
}
