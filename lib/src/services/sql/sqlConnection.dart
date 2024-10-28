import 'package:mysql_client/mysql_client.dart'; // Import the mysql_client package

class SqlConnection {
  static late MySQLSettings _settings; // Use a private variable for settings

  /// Sets the connection settings for the application.
  ///
  /// This method should be called before using any database interaction methods
  /// in the mixin. It's recommended to set the settings in a centralized location
  /// (e.g., a configuration file or environment variables) to avoid hardcoding
  /// credentials.
  static void setSettings(MySQLSettings settings) {
    _settings = settings;
  }

  /// Attempts to establish a connection to the MySQL database using the
  /// previously set connection settings.
  ///
  /// Throws a `StateError` if the connection settings haven't been set
  /// using `setSettings`.
  static Future<MySQLConnection> connect() async {
    if (_settings == null) {
      throw StateError(
          'Connection settings not set. Call SqlConnection.setSettings() before attempting to connect.');
    }

    final connection = await MySQLConnection.createConnection(
      host: _settings.host,
      port: _settings.port,
      userName: _settings.userName,
      password: _settings.password,
      databaseName: _settings.databaseName,
    );
    return connection;
  }

  /// Closes the connection to the MySQL database.
  ///
  /// This method should be called when you're finished using the connection
  /// to avoid resource leaks. It's recommended to close the connection
  /// within a `try...finally` block to ensure proper closure even in case of
  /// errors.
  static Future<void> closeConnection(MySQLConnection? mySQLConnection) async {
    await mySQLConnection!.close();
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
