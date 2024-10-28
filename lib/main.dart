import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/modules/App.dart';
import 'package:untitled/src/services/migrations/migration.dart';
import 'package:untitled/src/services/sql/sqlConnection.dart';

const String _user = 'finn';
const String _password = 'finn';
const String _databaseName = 'fulcrum_db';

main() async {
  /// init ConnectionSettings
  SqlConnection.setSettings(const MySQLSettings(
    userName: _user,
    password: _password,
    databaseName: _databaseName,
  ));

  runApp(const App());

  // await runMigration();
}

runMigration() async {
  final connection = await SqlConnection.connect();
  try {
    final success = await Migration.runAll(connection, QueryManager());
    if (success) {
      if (kDebugMode) {
        print('Migrations executed successfully');
      }
    } else {
      if (kDebugMode) {
        print('Migrations failed');
      }
    }
  } finally {
    await connection.close(); // Always close the connection
  }
}
