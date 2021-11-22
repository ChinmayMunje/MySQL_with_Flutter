import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/my_sql_database/mysql_helper.dart';

import 'add_new_course_page.dart';
import 'course_list.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  _CourseListPageState createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  void initState() {
    MySQLDbHelper.getCourses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text('Courses'),backgroundColor: Colors.white30,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewCourse(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: CourseList(),
    );
  }
}