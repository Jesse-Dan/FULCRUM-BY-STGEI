import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import 'package:untitled/src/core/sql/sqlConnection.dart';


class SqlBuilder with SqlConnection{
  late StringBuffer queryBuilder;
  late bool _transactionStarted;

  SqlBuilder() {
    queryBuilder = StringBuffer();
    _transactionStarted = false;
  }

  /// Start a SELECT query.
  SqlBuilder select() {
    queryBuilder.write('SELECT');
    return this;
  }

  /// Add all columns (*) to the SELECT query.
  SqlBuilder all() {
    queryBuilder.write(' *');
    return this;
  }

  /// Add the FROM keyword to the query.
  SqlBuilder from() {
    queryBuilder.write(' FROM');
    return this;
  }

  /// Specify the table name in the FROM clause.
  SqlBuilder table(String tableName) {
    queryBuilder.write(' $tableName');
    return this;
  }

  /// Add the WHERE keyword to the query.
  SqlBuilder where() {
    queryBuilder.write(' WHERE');
    return this;
  }

  /// Specify a column name in the query.
  SqlBuilder column(String columnName) {
    queryBuilder.write(' $columnName');
    return this;
  }

  /// Add the equals operator (=) to the query.
  SqlBuilder equals() {
    queryBuilder.write(' =');
    return this;
  }

  /// Add a parameter value to the query.
  SqlBuilder param(String value) {
    queryBuilder.write(' $value');
    return this;
  }

  /// Start an INSERT query.
  SqlBuilder insert() {
    queryBuilder.write(' INSERT');
    return this;
  }

  /// uses an INTO query, usually comes after INSERT [insert()].
  SqlBuilder into() {
    queryBuilder.write(' INTO');
    return this;
  }

  /// Add the VALUES keyword to the query.
  SqlBuilder values() {
    queryBuilder.write(' VALUES');
    return this;
  }

  /// Start an UPDATE query.
  SqlBuilder update() {
    queryBuilder.write(' UPDATE');
    return this;
  }

  /// Add the SET keyword to the query.
  SqlBuilder set() {
    queryBuilder.write(' SET');
    return this;
  }

  /// Start a DELETE query.
  SqlBuilder delete() {
    queryBuilder.write(' DELETE');
    return this;
  }

  /// Add the ORDER BY keyword to the query.
  SqlBuilder order() {
    queryBuilder.write(' ORDER BY');
    return this;
  }

  /// Add the GROUP BY keyword to the query.
  SqlBuilder group() {
    queryBuilder.write(' GROUP BY');
    return this;
  }

  /// Add the HAVING keyword to the query.
  SqlBuilder having() {
    queryBuilder.write(' HAVING');
    return this;
  }

  /// Add the JOIN keyword to the query.
  SqlBuilder join() {
    queryBuilder.write(' JOIN');
    return this;
  }

  /// Add the INNER keyword to the query.
  SqlBuilder inner() {
    queryBuilder.write(' INNER');
    return this;
  }

  /// Add the OUTER keyword to the query.
  SqlBuilder outer() {
    queryBuilder.write(' OUTER');
    return this;
  }

  /// Add the LEFT keyword to the query.
  SqlBuilder left() {
    queryBuilder.write(' LEFT');
    return this;
  }

  /// Add the RIGHT keyword to the query.
  SqlBuilder right() {
    queryBuilder.write(' RIGHT');
    return this;
  }

  /// Add the ON keyword to the query.
  SqlBuilder on() {
    queryBuilder.write(' ON');
    return this;
  }

  /// Add the AS keyword to the query.
  SqlBuilder as() {
    queryBuilder.write(' AS');
    return this;
  }

  /// Add the DISTINCT keyword to the query.
  SqlBuilder distinct() {
    queryBuilder.write(' DISTINCT');
    return this;
  }

  /// Add the COUNT keyword to the query.
  SqlBuilder count() {
    queryBuilder.write(' COUNT');
    return this;
  }

  /// Add the SUM keyword to the query.
  SqlBuilder sum() {
    queryBuilder.write(' SUM');
    return this;
  }

  /// Add the AVG keyword to the query.
  SqlBuilder avg() {
    queryBuilder.write(' AVG');
    return this;
  }

  /// Add the MAX keyword to the query.
  SqlBuilder max() {
    queryBuilder.write(' MAX');
    return this;
  }

  /// Add the MIN keyword to the query.
  SqlBuilder min() {
    queryBuilder.write(' MIN');
    return this;
  }

  /// Add the BETWEEN keyword to the query.
  SqlBuilder between() {
    queryBuilder.write(' BETWEEN');
    return this;
  }

  /// Add the AND keyword to the query.
  SqlBuilder and() {
    queryBuilder.write(' AND');
    return this;
  }

  /// Add the OR keyword to the query.
  SqlBuilder or() {
    queryBuilder.write(' OR');
    return this;
  }

  /// Add the IN keyword to the query.
  SqlBuilder inKeyword() {
    queryBuilder.write(' IN');
    return this;
  }

  /// Add the LIKE keyword to the query.
  SqlBuilder like() {
    queryBuilder.write(' LIKE');
    return this;
  }

  /// Add the NOT keyword to the query.
  SqlBuilder not() {
    queryBuilder.write(' NOT');
    return this;
  }

  /// Add the NULL keyword to the query.
  SqlBuilder nullValue() {
    queryBuilder.write(' NULL');
    return this;
  }

  /// Add the UNION keyword to the query.
  SqlBuilder union() {
    queryBuilder.write(' UNION');
    return this;
  }

  /// Add the EXISTS keyword to the query.
  SqlBuilder exists() {
    queryBuilder.write(' EXISTS');
    return this;
  }

  /// Add the ANY keyword to the query.
  SqlBuilder any() {
    queryBuilder.write(' ANY');
    return this;
  }

  /// Add the ALL keyword to the query.
  SqlBuilder allKeyword() {
    queryBuilder.write(' ALL');
    return this;
  }

  /// Add the SOME keyword to the query.
  SqlBuilder some() {
    queryBuilder.write(' SOME');
    return this;
  }

  /// Add the LIMIT keyword to the query.
  SqlBuilder limit() {
    queryBuilder.write(' LIMIT');
    return this;
  }

  /// Add the OFFSET keyword to the query.
  SqlBuilder offset() {
    queryBuilder.write(' OFFSET');
    return this;
  }

  /// Add the INNER JOIN keywords to the query.
  SqlBuilder innerJoin() {
    queryBuilder.write(' INNER JOIN');
    return this;
  }

  /// Add the LEFT JOIN keywords to the query.
  SqlBuilder leftJoin() {
    queryBuilder.write(' LEFT JOIN');
    return this;
  }

  /// Add the RIGHT JOIN keywords to the query.
  SqlBuilder rightJoin() {
    queryBuilder.write(' RIGHT JOIN');
    return this;
  }

  /// Add the FULL JOIN keywords to the query.
  SqlBuilder fullJoin() {
    queryBuilder.write(' FULL JOIN');
    return this;
  }

  /// Add the CROSS JOIN keywords to the query.
  SqlBuilder crossJoin() {
    queryBuilder.write(' CROSS JOIN');
    return this;
  }

  /// Add the NATURAL JOIN keywords to the query.
  SqlBuilder naturalJoin() {
    queryBuilder.write(' NATURAL JOIN');
    return this;
  }

  /// Add the CASCADE keyword to the query.
  SqlBuilder cascade() {
    queryBuilder.write(' CASCADE');
    return this;
  }

  /// Add the RESTRICT keyword to the query.
  SqlBuilder restrict() {
    queryBuilder.write(' RESTRICT');
    return this;
  }

  /// Add the SET NULL keywords to the query.
  SqlBuilder setNull() {
    queryBuilder.write(' SET NULL');
    return this;
  }

  /// Add the SET DEFAULT keywords to the query.
  SqlBuilder setDefault() {
    queryBuilder.write(' SET DEFAULT');
    return this;
  }

  /// Add the PRIMARY KEY keywords to the query.
  SqlBuilder primaryKey() {
    queryBuilder.write(' PRIMARY KEY');
    return this;
  }

  /// Add the FOREIGN KEY keywords to the query.
  SqlBuilder foreignKey() {
    queryBuilder.write(' FOREIGN KEY');
    return this;
  }

  /// Add the REFERENCES keyword to the query.
  SqlBuilder references() {
    queryBuilder.write(' REFERENCES');
    return this;
  }

  /// Add the CHECK keyword to the query.
  SqlBuilder check() {
    queryBuilder.write(' CHECK');
    return this;
  }

  /// Add the UNIQUE keyword to the query.
  SqlBuilder unique() {
    queryBuilder.write(' UNIQUE');
    return this;
  }

  /// Add the INDEX keyword to the query.
  SqlBuilder index() {
    queryBuilder.write(' INDEX');
    return this;
  }

  /// Add the DEFAULT keyword to the query.
  SqlBuilder defaultKeyword() {
    queryBuilder.write(' DEFAULT');
    return this;
  }

  /// Add the AUTOINCREMENT keyword to the query.
  SqlBuilder autoIncrement() {
    queryBuilder.write(' AUTOINCREMENT');
    return this;
  }

  /// Add the COMMIT keyword to the query.
  SqlBuilder commit() {
    queryBuilder.write(' COMMIT');
    return this;
  }

  /// Add the ROLLBACK keyword to the query.
  SqlBuilder rollback() {
    queryBuilder.write(' ROLLBACK');
    return this;
  }

  /// Add the SAVEPOINT keyword to the query.
  SqlBuilder savepoint() {
    queryBuilder.write(' SAVEPOINT');
    return this;
  }

  /// Add the BEGIN keyword to the query.
  SqlBuilder begin() {
    queryBuilder.write(' BEGIN');
    return this;
  }

  /// Add the END keyword to the query.
  SqlBuilder end() {
    queryBuilder.write(' END');
    return this;
  }

  /// Add the TRANSACTION keyword to the query.
  SqlBuilder transaction() {
    queryBuilder.write(' TRANSACTION');
    return this;
  }

  /// Add the WORK keyword to the query.
  SqlBuilder work() {
    queryBuilder.write(' WORK');
    return this;
  }

  /// Execute the constructed query.
  Future<dynamic> execute() async {
    try {
      if (kDebugMode) {
        print('Executing query: ${queryBuilder.toString().trim()}');
      }
      var conn = await MySqlConnection.connect(settings);
      conn.query(queryBuilder.toString().trim());
      if (kDebugMode) {
        print('Executed query: ${queryBuilder.toString().trim()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('UnknownException: ${e.toString()}');
      }
    }

    // Reset the query builder for the next query
    queryBuilder.clear();
  }

  /// Begins a transaction if one is not already in progress.
  SqlBuilder beginTransaction() {
    if (!_transactionStarted) {
      queryBuilder.write('BEGIN TRANSACTION; ');
      _transactionStarted = true;
    }
    return this;
  }

  /// Commits the transaction if one is in progress.
  SqlBuilder commitTransaction() {
    if (_transactionStarted) {
      queryBuilder.write(' COMMIT; ');
      _transactionStarted = false;
    }
    return this;
  }

  /// Rolls back the transaction if one is in progress.
  SqlBuilder rollbackTransaction() {
    if (_transactionStarted) {
      queryBuilder.write(' ROLLBACK; ');
      _transactionStarted = false;
    }
    return this;
  }
}
