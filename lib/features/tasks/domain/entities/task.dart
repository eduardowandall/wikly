class Task {
  String? id;
  String title;
  DateTime date;
  int dayOfWeekIndex;
  bool done;

  Task({
    this.id,
    required this.title,
    required this.date,
    required this.dayOfWeekIndex,
    this.done = false,
  });
}
