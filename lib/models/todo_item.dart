class TodoItem {
  final String id;
  String title;
  DateTime date;
  int dayOfWeekIndex;
  bool done;

  TodoItem({
    required this.id,
    required this.title,
    required this.date,
    required this.dayOfWeekIndex,
    this.done = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'dayOfWeekIndex': dayOfWeekIndex,
      'done': done,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      title: map['title'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      dayOfWeekIndex: map['dayOfWeekIndex'],
      done: map['done'],
    );
  }
}
