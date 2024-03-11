class History<T>{
final int id;
final Map<DateTime, List<T>> history;

  History({required this.id, required this.history});
}