import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/my_sql_database/mysql_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateCourse extends StatefulWidget {
  final String id;
  final String orgCourseName;
  final String orgCourseImg;
  final String orgCourseDuration;
  final String orgCoursePrice;
  final String orgCourseLink;

  UpdateCourse(
      {required this.id,
      required this.orgCourseName,
      required this.orgCourseImg,
      required this.orgCourseDuration,
      required this.orgCoursePrice,
      required this.orgCourseLink});

  @override
  _UpdateCourseSQLitePageState createState() => _UpdateCourseSQLitePageState();
}

class _UpdateCourseSQLitePageState extends State<UpdateCourse> {
  var courseName = "";
  var courseImgUrl = "";
  var courseDuration = "";
  var coursePrice = "";
  var courseLink = "";

  // Create a text controller and use it to retrieve the current value
  final courseNameController = TextEditingController();
  final courseImageController = TextEditingController();
  final courseDurationController = TextEditingController();
  final coursePriceController = TextEditingController();
  final courseLinkController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    courseNameController.dispose();
    courseImageController.dispose();
    courseDurationController.dispose();
    coursePriceController.dispose();
    courseLinkController.dispose();
    super.dispose();
  }

  clearText() {
    courseNameController.clear();
    courseImageController.clear();
    courseDurationController.clear();
    coursePriceController.clear();
    courseLinkController.clear();
  }

  displayMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white);
    Navigator.pop(context, true);
  }

  Future<void> update(String id, String courseName, String courseImg,
      String courseDuration, String coursePrice, String courseLink) async {
    await MySQLDbHelper.updateCourse(
        id, courseName, courseImg, courseDuration, courseLink, coursePrice);
    displayMessage('Course Updated..');
  }

  Future<void> deleteCourse(String id) async {
    await MySQLDbHelper.deleteCourse(id);
    displayMessage('Course Deleted..');
  }

  @override
  Widget build(BuildContext context) {
    courseNameController.text = widget.orgCourseName;
    courseImageController.text = widget.orgCourseImg;
    coursePriceController.text = widget.orgCoursePrice;
    courseLinkController.text = widget.orgCourseLink;
    courseDurationController.text = widget.orgCourseDuration;

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Text('Update Or Delete Course'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Course Name',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: courseNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Course Name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Course Image Url',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: courseImageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Course Image URL';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Course Duration',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: courseDurationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Course Duration';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Course Price',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: coursePriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Course Price';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0)),
                    labelText: 'Course Link',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: courseLinkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Course Link';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.white30),
                        onPressed: () {
                          setState(() {
                            courseName = courseNameController.text;
                            courseImgUrl = courseImageController.text;
                            coursePrice = coursePriceController.text;
                            courseDuration = courseDurationController.text;
                            courseLink = courseLinkController.text;
                            print("COURSE ID  is " + widget.id);

                            update(widget.id, courseName, courseImgUrl,
                                courseDuration, coursePrice, courseLink);
                            clearText();
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Update Course'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.white30),
                        onPressed: () {
                          setState(() {
                            courseName = courseNameController.text;
                            courseImgUrl = courseImageController.text;
                            coursePrice = coursePriceController.text;
                            courseDuration = courseDurationController.text;
                            courseLink = courseLinkController.text;
                            deleteCourse(widget.id);
                            clearText();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Delete Course'),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
