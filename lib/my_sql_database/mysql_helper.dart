import 'dart:convert';

import 'package:dio/dio.dart';

class MySQLDbHelper {
  static Future<String> addCourse(
      courseName, courseImg, courseDuration, courseLink, coursePrice) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      'courseName': courseName,
      'courseImg': courseImg,
      'courseDuration': courseDuration,
      'courseLink': courseLink,
      'coursePrice': coursePrice,
    });
    var response = await dio.post(
        'https://exclusive-cottons.000webhostapp.com/flutter_courses/add_flutter_course.php',
        data: formData);
    print("RESPONSE IS " + (response.toString()));
    return response.toString();
  }

  static Future<String> updateCourse(courseId, courseName, courseImg, courseDuration,
      courseLink, coursePrice) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      'id': courseId,
      'courseName': courseName,
      'courseImg': courseImg,
      'courseDuration': courseDuration,
      'courseLink': courseLink,
      'coursePrice': coursePrice,
    });
    var response = await dio.post(
        'https://exclusive-cottons.000webhostapp.com/flutter_courses/update_flutter_course.php',
        data: formData);
    print("RESPONSE IS " + (response.toString()));
    return response.toString();
  }

 static Future<String> deleteCourse(courseId) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      'id': courseId,
    });
    var response = await dio.post(
        'https://exclusive-cottons.000webhostapp.com/flutter_courses/delete_flutter_course.php',
        data: formData);
    print("RESPONSE IS " + (response.toString()));
    return response.toString();
  }

 static Future<Response> getCourses() async{
    Response response;
    var dio = Dio();
    response = await dio.get('https://exclusive-cottons.000webhostapp.com/flutter_courses/read_flutter_courses.php');

   // print("JSON DATA IS "+response.toString());

    return response;
}


}
