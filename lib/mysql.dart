import 'package:mysql1/mysql1.dart';

class MySQL {
  static String host = 'exclusive-cottons.000webhostapp.com',
      user = 'id16310745_gfgdb',
      password = "-TZP<*0C*{s~bG0j",
      db = 'courseDb';
  static int port = 43753;

  MySQL();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);

    return await MySqlConnection.connect(settings);
  }
}
