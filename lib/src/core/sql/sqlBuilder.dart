class SqlQueryBuilder {
  late StringBuffer queryBuilder;
  late bool _transactionStarted;

  SqlQueryBuilder() {
    queryBuilder.clear();
    queryBuilder = StringBuffer();
    _transactionStarted = false;
  }

  /// Start a SELECT query.
  SqlQueryBuilder select() {
    queryBuilder.write('SELECT');
    return this;
  }

  /// Add all columns (*) to the SELECT query.
  SqlQueryBuilder all() {
    queryBuilder.write(' *');
    return this;
  }

  /// Add the FROM keyword to the query.
  SqlQueryBuilder from() {
    queryBuilder.write(' FROM');
    return this;
  }

  /// Specify the table name in the FROM clause.
  SqlQueryBuilder table(String tableName) {
    queryBuilder.write(' $tableName');
    return this;
  }

  /// Add the WHERE keyword to the query.
  SqlQueryBuilder where() {
    queryBuilder.write(' WHERE');
    return this;
  }

  /// Specify a column name in the query.
  SqlQueryBuilder column(String columnName) {
    queryBuilder.write(' $columnName');
    return this;
  }

  /// Add the equals operator (=) to the query.
  SqlQueryBuilder equals() {
    queryBuilder.write(' =');
    return this;
  }

  /// Add a parameter value to the query.
  SqlQueryBuilder param(String value) {
    queryBuilder.write(' $value');
    return this;
  }

  /// Add a ( to the query.
  SqlQueryBuilder leftB() {
    queryBuilder.write('(');
    return this;
  }

  /// Add a ) to the query.
  SqlQueryBuilder rightB() {
    queryBuilder.write(')');
    return this;
  }

  /// Start an INSERT query.
  SqlQueryBuilder insert() {
    queryBuilder.write(' INSERT');
    return this;
  }

  /// uses an INTO query, usually comes after INSERT [insert()].
  SqlQueryBuilder into() {
    queryBuilder.write(' INTO');
    return this;
  }

  /// Add the VALUES keyword to the query.
  SqlQueryBuilder values() {
    queryBuilder.write(' VALUES');
    return this;
  }

  /// Start an UPDATE query.
  SqlQueryBuilder update() {
    queryBuilder.write(' UPDATE');
    return this;
  }

  /// Add the SET keyword to the query.
  SqlQueryBuilder set() {
    queryBuilder.write(' SET');
    return this;
  }

  /// Start a DELETE query.
  SqlQueryBuilder delete() {
    queryBuilder.write(' DELETE');
    return this;
  }

  /// Add the ORDER BY keyword to the query.
  SqlQueryBuilder order() {
    queryBuilder.write(' ORDER BY');
    return this;
  }

  /// Add the GROUP BY keyword to the query.
  SqlQueryBuilder group() {
    queryBuilder.write(' GROUP BY');
    return this;
  }

  /// Add the HAVING keyword to the query.
  SqlQueryBuilder having() {
    queryBuilder.write(' HAVING');
    return this;
  }

  /// Add the JOIN keyword to the query.
  SqlQueryBuilder join() {
    queryBuilder.write(' JOIN');
    return this;
  }

  /// Add the INNER keyword to the query.
  SqlQueryBuilder inner() {
    queryBuilder.write(' INNER');
    return this;
  }

  /// Add the OUTER keyword to the query.
  SqlQueryBuilder outer() {
    queryBuilder.write(' OUTER');
    return this;
  }

  /// Add the LEFT keyword to the query.
  SqlQueryBuilder left() {
    queryBuilder.write(' LEFT');
    return this;
  }

  /// Add the RIGHT keyword to the query.
  SqlQueryBuilder right() {
    queryBuilder.write(' RIGHT');
    return this;
  }

  /// Add the ON keyword to the query.
  SqlQueryBuilder on() {
    queryBuilder.write(' ON');
    return this;
  }

  /// Add the AS keyword to the query.
  SqlQueryBuilder as() {
    queryBuilder.write(' AS');
    return this;
  }

  /// Add the DISTINCT keyword to the query.
  SqlQueryBuilder distinct() {
    queryBuilder.write(' DISTINCT');
    return this;
  }

  /// Add the COUNT keyword to the query.
  SqlQueryBuilder count() {
    queryBuilder.write(' COUNT');
    return this;
  }

  /// Add the SUM keyword to the query.
  SqlQueryBuilder sum() {
    queryBuilder.write(' SUM');
    return this;
  }

  /// Add the AVG keyword to the query.
  SqlQueryBuilder avg() {
    queryBuilder.write(' AVG');
    return this;
  }

  /// Add the MAX keyword to the query.
  SqlQueryBuilder max() {
    queryBuilder.write(' MAX');
    return this;
  }

  /// Add the MIN keyword to the query.
  SqlQueryBuilder min() {
    queryBuilder.write(' MIN');
    return this;
  }

  /// Add the BETWEEN keyword to the query.
  SqlQueryBuilder between() {
    queryBuilder.write(' BETWEEN');
    return this;
  }

  /// Add the AND keyword to the query.
  SqlQueryBuilder and() {
    queryBuilder.write(' AND');
    return this;
  }

  /// Add the OR keyword to the query.
  SqlQueryBuilder or() {
    queryBuilder.write(' OR');
    return this;
  }

  /// Add the IN keyword to the query.
  SqlQueryBuilder inKeyword() {
    queryBuilder.write(' IN');
    return this;
  }

  /// Add the LIKE keyword to the query.
  SqlQueryBuilder like() {
    queryBuilder.write(' LIKE');
    return this;
  }

  /// Add the NOT keyword to the query.
  SqlQueryBuilder not() {
    queryBuilder.write(' NOT');
    return this;
  }

  /// Add the NULL keyword to the query.
  SqlQueryBuilder nullValue() {
    queryBuilder.write(' NULL');
    return this;
  }

  /// Add the UNION keyword to the query.
  SqlQueryBuilder union() {
    queryBuilder.write(' UNION');
    return this;
  }

  /// Add the EXISTS keyword to the query.
  SqlQueryBuilder exists() {
    queryBuilder.write(' EXISTS');
    return this;
  }

  /// Add the ANY keyword to the query.
  SqlQueryBuilder any() {
    queryBuilder.write(' ANY');
    return this;
  }

  /// Add the ALL keyword to the query.
  SqlQueryBuilder allKeyword() {
    queryBuilder.write(' ALL');
    return this;
  }

  /// Add the SOME keyword to the query.
  SqlQueryBuilder some() {
    queryBuilder.write(' SOME');
    return this;
  }

  /// Add the LIMIT keyword to the query.
  SqlQueryBuilder limit() {
    queryBuilder.write(' LIMIT');
    return this;
  }

  /// Add the OFFSET keyword to the query.
  SqlQueryBuilder offset() {
    queryBuilder.write(' OFFSET');
    return this;
  }

  /// Add the INNER JOIN keywords to the query.
  SqlQueryBuilder innerJoin() {
    queryBuilder.write(' INNER JOIN');
    return this;
  }

  /// Add the LEFT JOIN keywords to the query.
  SqlQueryBuilder leftJoin() {
    queryBuilder.write(' LEFT JOIN');
    return this;
  }

  /// Add the RIGHT JOIN keywords to the query.
  SqlQueryBuilder rightJoin() {
    queryBuilder.write(' RIGHT JOIN');
    return this;
  }

  /// Add the FULL JOIN keywords to the query.
  SqlQueryBuilder fullJoin() {
    queryBuilder.write(' FULL JOIN');
    return this;
  }

  /// Add the CROSS JOIN keywords to the query.
  SqlQueryBuilder crossJoin() {
    queryBuilder.write(' CROSS JOIN');
    return this;
  }

  /// Add the NATURAL JOIN keywords to the query.
  SqlQueryBuilder naturalJoin() {
    queryBuilder.write(' NATURAL JOIN');
    return this;
  }

  /// Add the CASCADE keyword to the query.
  SqlQueryBuilder cascade() {
    queryBuilder.write(' CASCADE');
    return this;
  }

  /// Add the RESTRICT keyword to the query.
  SqlQueryBuilder restrict() {
    queryBuilder.write(' RESTRICT');
    return this;
  }

  /// Add the SET NULL keywords to the query.
  SqlQueryBuilder setNull() {
    queryBuilder.write(' SET NULL');
    return this;
  }

  /// Add the SET DEFAULT keywords to the query.
  SqlQueryBuilder setDefault() {
    queryBuilder.write(' SET DEFAULT');
    return this;
  }

  /// Add the PRIMARY KEY keywords to the query.
  SqlQueryBuilder primaryKey() {
    queryBuilder.write(' PRIMARY KEY');
    return this;
  }

  /// Add the FOREIGN KEY keywords to the query.
  SqlQueryBuilder foreignKey() {
    queryBuilder.write(' FOREIGN KEY');
    return this;
  }

  /// Add the REFERENCES keyword to the query.
  SqlQueryBuilder references() {
    queryBuilder.write(' REFERENCES');
    return this;
  }

  /// Add the CHECK keyword to the query.
  SqlQueryBuilder check() {
    queryBuilder.write(' CHECK');
    return this;
  }

  /// Add the UNIQUE keyword to the query.
  SqlQueryBuilder unique() {
    queryBuilder.write(' UNIQUE');
    return this;
  }

  /// Add the INDEX keyword to the query.
  SqlQueryBuilder index() {
    queryBuilder.write(' INDEX');
    return this;
  }

  /// Add the DEFAULT keyword to the query.
  SqlQueryBuilder defaultKeyword() {
    queryBuilder.write(' DEFAULT');
    return this;
  }

  /// Add the AUTOINCREMENT keyword to the query.
  SqlQueryBuilder autoIncrement() {
    queryBuilder.write(' AUTOINCREMENT');
    return this;
  }

  /// Add the COMMIT keyword to the query.
  SqlQueryBuilder commit() {
    queryBuilder.write(' COMMIT');
    return this;
  }

  /// Add the ROLLBACK keyword to the query.
  SqlQueryBuilder rollback() {
    queryBuilder.write(' ROLLBACK');
    return this;
  }

  /// Add the SAVEPOINT keyword to the query.
  SqlQueryBuilder savepoint() {
    queryBuilder.write(' SAVEPOINT');
    return this;
  }

  /// Add the BEGIN keyword to the query.
  SqlQueryBuilder begin() {
    queryBuilder.write(' BEGIN');
    return this;
  }

  /// Add the END keyword to the query.
  SqlQueryBuilder end() {
    queryBuilder.write(' END');
    return this;
  }

  /// Add the TRANSACTION keyword to the query.
  SqlQueryBuilder transaction() {
    queryBuilder.write(' TRANSACTION');
    return this;
  }

  /// Add the WORK keyword to the query.
  SqlQueryBuilder work() {
    queryBuilder.write(' WORK');
    return this;
  }

  /// Execute the constructed query.
  String buildStmt() {
    return queryBuilder.toString().trim();
  }

  /// Begins a transaction if one is not already in progress.
  SqlQueryBuilder beginTransaction() {
    if (!_transactionStarted) {
      queryBuilder.write('BEGIN TRANSACTION; ');
      _transactionStarted = true;
    }
    return this;
  }

  /// Commits the transaction if one is in progress.
  SqlQueryBuilder commitTransaction() {
    if (_transactionStarted) {
      queryBuilder.write(' COMMIT; ');
      _transactionStarted = false;
    }
    return this;
  }

  /// Rolls back the transaction if one is in progress.
  SqlQueryBuilder rollbackTransaction() {
    if (_transactionStarted) {
      queryBuilder.write(' ROLLBACK; ');
      _transactionStarted = false;
    }
    return this;
  }
}
