import 'package:mysql_client/mysql_client.dart';

class SqlHelper {
  static final SqlHelper _instance = SqlHelper._internal();

  factory SqlHelper() {
    return _instance;
  }

  SqlHelper._internal();

  MySQLConnection? _connection;
  String? _host;
  int? _port;
  String? _user;
  String? _password;
  String? _database;

  Future<void> configure({
    required String host,
    required int port,
    required String user,
    required String password,
    required String database,
  }) async {
    if (_connection != null) {
      throw Exception('Database configuration can only be set once.');
    }

    _host = host;
    _port = port;
    _user = user;
    _password = password;
    _database = database;
  }

  Future<MySQLConnection?> getConnection() async {
    if (_connection == null) {
      if (_host == null ||
          _port == null ||
          _user == null ||
          _password == null ||
          _database == null) {
        throw Exception('Database configuration not set.');
      }

      var settings = MySQLSettings(
        host: _host!,
        port: _port!,
        userName: _user!,
        password: _password!,
        databaseName: _database!,
      );
      var connection = await MySQLConnection.createConnection(
        host: settings.host,
        port: settings.port,
        userName: settings.userName,
        password: settings.password,
        databaseName: settings.databaseName,
      );
      _connection = connection;
    }

    return _connection;
  }

  Future<IResultSet?> executeQuery(String query) async {
    var connection = await getConnection();
    if (connection != null) {
      try {
        var results = await connection.execute(query);
        return results;
      } catch (e) {
        print('Error executing query: $e');
        return null;
      }
    } else {
      print('Error: Could not get connection.');
      return null;
    }
  }

  Future<void> closeConnection() async {
    if (_connection != null) {
      await _connection!.close();
      _connection = null; // Release the connection for future use
    }
  }
}

class MySQLSettings {
  final String host;
  final int port;
  final String userName;
  final String password;
  final String? databaseName; // Optional database name

  const MySQLSettings({
    this.host = 'localhost',
    this.port = 3306,
    required this.userName,
    required this.password,
    this.databaseName,
  });
}
