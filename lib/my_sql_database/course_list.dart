import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/my_sql_database/update_course_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<DataModal> dataList = [];
  bool isLoading = true;
  late final list;

  Future<void> getAllCourses() async {
    Response response;
    var dio = Dio();
    response = await dio.get(
        'https://exclusive-cottons.000webhostapp.com/flutter_courses/read_flutter_courses.php');
    final list = json.decode(response.data) as List<dynamic>;
    dataList = list.map((e) => DataModal.fromJson(e)).toList();
    setState(() {
      if (dataList.isNotEmpty) {
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getAllCourses();
    });
    return Container(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateCourse(
                            id: dataList[index].id,
                            orgCourseName: dataList[index].courseName,
                            orgCourseImg: dataList[index].courseImg,
                            orgCoursePrice: dataList[index].coursePrice,
                            orgCourseDuration: dataList[index].courseDuration,
                            orgCourseLink: dataList[index].courseLink),
                      ),
                    );
                  },
                  child: DataCard(
                    courseName: dataList[index].courseName,
                    courseImg: dataList[index].courseImg,
                    coursePrice: dataList[index].coursePrice,
                    courseDuration: dataList[index].courseDuration,
                    courseLink: dataList[index].courseLink,
                  ),
                );
              }),
    );
  }
}

class DataModal {
  DataModal({
    required this.id,
    required this.courseName,
    required this.courseDuration,
    required this.coursePrice,
    required this.courseImg,
    required this.courseLink,
  });

  String id;
  String courseName;
  String courseDuration;
  String coursePrice;
  String courseImg;
  String courseLink;

  factory DataModal.fromJson(Map<String, dynamic> json) => DataModal(
        id: json['id'],
        courseName: json['courseName'],
        courseDuration: json["courseDuration"],
        coursePrice: json['coursePrice'],
        courseLink: json['courseLink'],
        courseImg: json['courseImg'],
      );
}

class DataCard extends StatelessWidget {
  final String courseName, courseImg, coursePrice, courseDuration, courseLink;

  DataCard(
      {required this.courseName,
      required this.courseImg,
      required this.coursePrice,
      required this.courseDuration,
      required this.courseLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white24,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    courseImg,
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Course Duration : " + courseDuration,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Course Price : " + coursePrice,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    // SizedBox(
                    //   height: 3,
                    // ),
                    // Container(
                    //   width: 210,
                    //   child: Text(courseDesc,
                    //       maxLines: 3,
                    //       style: TextStyle(fontSize: 12, color: Colors.white),
                    //       textAlign: TextAlign.start),
                    // ),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 4,
            // ),
            // SizedBox(
            //   height: 3,
            // ),
            Container(
                width: 400,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black45),
                    onPressed: () {
                      //const url = 'https://flutter.io';
                      //if (canLaunch(url) != null) {
                      launch(courseLink);
                      //} else {
                      //throw 'Could not launch $url';
                      //}
                    },
                    child: Text("Enroll Now"))),
          ],
        ),
      ),
    );
  }
}
