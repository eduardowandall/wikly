import 'package:wikly/features/tasks/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required id,
    required title,
    required date,
    required dayOfWeekIndex,
    done = false,
  }) : super(
          id: id,
          date: date,
          dayOfWeekIndex: dayOfWeekIndex,
          title: title,
          done: done,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'dayOfWeekIndex': dayOfWeekIndex,
      'done': done,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      dayOfWeekIndex: map['dayOfWeekIndex'],
      done: map['done'],
    );
  }
}
