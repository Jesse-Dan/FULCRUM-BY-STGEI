
import '../../../../models/User.dart';

class Novel {
  final int id;
  final String name;
  final int pageCount;
  Map<User, List<Map<Novel, int>>>? history;

  Novel({required this.id, required this.name, required this.pageCount});
}
