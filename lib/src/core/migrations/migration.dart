import 'package:flutter/foundation.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:untitled/src/core/sql/sqlBuilder.dart';
import 'package:untitled/src/core/sql/sqlConnection.dart';
import 'package:untitled/src/models/User.dart';

class Migration extends SqlQueryBuilder {
  final String id;

  Migration({required this.id});

  static Future<bool> runAll(
      MySQLConnection database, QueryManager queryManager) async {
    for (final migration in _migrations) {
      final idString =
          migration.id.toString(); // Convert id to string for query retrieval
      final queries = await queryManager.getMigrationQueriesFor(idString);
      await migration.run(database, queries);
    }
    return true; // Or return a value indicating success/failure
  }

  Future<void> run(MySQLConnection database, List<String> queries) async {
    for (final query in queries) {
      try {
        await database.execute(query);
        if (kDebugMode) {
          print('Migration $id: Executed query: $query');
        } // Log successful execution
      } catch (error) {
        if (kDebugMode) {
          print('Migration $id: Error executing query: $query');
        }
        if (kDebugMode) {
          print('Error: $error');
        } // Log detailed error message
        // Consider rethrowing or implementing rollback logic here
      }
    }
  }

  // Replace with your actual migrations (implement their execute methods)
  static final List<Migration> _migrations = [
    Migration(id: 'users'),
  ];
}

class QueryManager {
  QueryManager();

  Future<List<String>> getMigrationQueriesFor(String migrationId) async {
    return _migrations[migrationId] ?? [];
  }

  final Map<String, List<String>> _migrations = {'users': User.queries};
}
