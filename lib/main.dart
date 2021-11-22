import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/home_page.dart';
import 'package:flutter_mongo_db/picture_in_picture.dart';

import 'floating_overlay_widget.dart';
import 'my_sql_database/course_list_page.dart';

//db password
//   um}7}>Zj\pE$Y5pW

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CourseListPage(),
    );
  }
}
