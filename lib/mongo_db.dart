import 'package:flutter_mongo_db/course_modal.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var  courseCollection;

  static connect() async {
    //mongodb+srv://csmunje:chan1069@cluster0.6tkvh.mongodb.net/test
    //db =  Db("mongodb+srv://csmunje:chan1069@myDatabase/myCourses");
    var db = Db('mongodb://csmunje:chan1069@'
        'cluster0-shard-00-00.6tkvh.mongodb.net:27017,'
        'cluster0-shard-00-01.6tkvh.mongodb.net:27017,'
        'cluster0-shard-00-02.6tkvh.mongodb.net:27017'
        'mongo_dart-blog?authSource=admin&compressors=disabled'
        '&gssapiServiceName=mongodb&replicaSet=atlas-stcn2i-shard-0'
        '&ssl=true');
    await db.open();
    courseCollection = db.collection("myCourses");
  }

  static Future<List<Map<String, dynamic>>?> getDocuments() async {
    try {
      connect();
      await courseCollection.find().forEach((v) {
        print("COurse is "+v.toString()+"\n\n"+v+"\n\n\n\n");
        //authors[v['name'].toString()] = v;
      });
      final courses = await courseCollection.find().toList();
      return courses;
    } catch (e) {
      print("Error is : "+e.toString());
      return null;
    }
  }

  static insert(Course course) async {
    await courseCollection.insertAll([course.toMap()]);
  }

  static update(Course course) async {
    var u = await courseCollection.findOne({"_id": course.id});
    u["courseName"] = course.courseName;
    u["courseImg"] = course.courseImg;
    u["coursePrice"] = course.coursePrice;
    u["courseLink"] = course.courseLink;
    u["courseDuration"] = course.courseDuration;

    await courseCollection.save(u);
  }

  static delete(Course course) async {
    await courseCollection.remove(where.id(course.id));
  }
}
