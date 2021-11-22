import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/mongo_db.dart';

import 'course_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            print("Error occured");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print("Please wait");
          } else {
            print("DAT IS " + snapshot.data.toString());
          }
          return const Center(
            child: Text("Print the Output"),
          );
        },
        future: MongoDatabase.getDocuments());
  }

// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//       future: MongoDatabase.getDocuments(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Container(
//             color: Colors.white,
//             child: const LinearProgressIndicator(
//               backgroundColor: Colors.black,
//             ),
//           );
//         } else {
//           if (snapshot.hasError) {
//             return Container(
//               color: Colors.white,
//               child: Center(
//                 child: Text(
//                   'Something went wrong, try again.',
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//               ),
//             );
//           } else {
//             // final List storedocs = [];
//             // snapshot.data.docs.map((DocumentSnapshot document) {
//             //   Map a = document.data() as Map<String, dynamic>;
//             //   storedocs.add(a);
//             //   a['id'] = document.id;
//             // }).toList();
//             if (snapshot.hasData) {
//               print("DATA FROM DATABASE IS " + snapshot.data.toString());
//
//               // return Scaffold(
//               //   appBar: AppBar(
//               //     title: Text('MongoDB Flutter'),
//               //   ),
//               //   body: ListView.builder(
//               //     itemBuilder: (context, index) {
//               //       return Padding(
//               //         padding: const EdgeInsets.all(8.0),
//               //         child: DataCard(
//               //           course: Course.fromMap(snapshot.data[index]),
//               //         ),
//               //       );
//               //     },
//               //     itemCount: snapshot.data.length,
//               //   ),
//               //   floatingActionButton: FloatingActionButton(
//               //     onPressed: () {
//               //       Navigator.push(context,
//               //           MaterialPageRoute(builder: (BuildContext context) {
//               //         return AddUserPage();
//               //       })).then((value) => setState(() {}));
//               //     },
//               //     child: Icon(Icons.add),
//               //   ),
//               // );
//             }
//           }
//         }
//       });
// }

// _deleteUser(Course user) async {
//   await MongoDatabase.delete(user);
//   setState(() {});
// }
}

class DataCard extends StatelessWidget {
  // final String courseName,
  //     courseImg,
  //     courseDesc,
  //     coursePrice,
  //     courseDuration,
  //     courseLink;

  final Course course;

  const DataCard({
    Key? key,
    required this.course,
  }) : super(key: key);

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
                    course.courseImg,
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
                      course.courseName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Course Duration : " + course.courseDuration,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Course Price : " + course.coursePrice,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: 400,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black45),
                    onPressed: () {
                      //const url = 'https://flutter.io';
                      //if (canLaunch(url) != null) {
                      // launch(courseLink);
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
