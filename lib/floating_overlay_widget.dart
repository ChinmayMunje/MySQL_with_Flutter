import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongo_db/my_sql_database/mysql_helper.dart';
import 'package:slide_button/slide_button.dart';

class FOWidget extends StatefulWidget {
  const FOWidget({Key? key}) : super(key: key);

  @override
  _FOWidgetState createState() => _FOWidgetState();
}

class _FOWidgetState extends State<FOWidget> {


  Future<void>getCourses() async{
    final data = await MySQLDbHelper.getCourses();

}
  @override
  void initState() {
    getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          const Center(
              child: Text(
            'Lock Screen',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30),
          )),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SlideButton(
                borderRadius: 20.0,
                height: 64,
                backgroundChild: const Center(
                  child: Text(
                    "Swipe right to unlock",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.green,
                slidingBarColor: Colors.white,
                slidingChild: SizedBox(
                    child: Image.asset('assets/arrow2.png',
                        height: 20, width: 20)),
                slideDirection: SlideDirection.RIGHT,
                onButtonOpened: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Welcome to Geeks for Geeks',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
