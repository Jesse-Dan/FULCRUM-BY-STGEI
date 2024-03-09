import '../../helpers/pluralizer.dart';
import '../sql/sqlBuilder.dart';

abstract class Repository<T> extends SqlBuilder {

  late String? tableName;

  @override
  SqlBuilder all() {
    String className = T.toString().toLowerCase();
    tableName = pluralizeClassName(className);
    super.queryBuilder.write('SELECT * FROM $tableName');
    return this;
  }


  String pluralizeClassName(String className) {
    return pluralize(className);
  }
}