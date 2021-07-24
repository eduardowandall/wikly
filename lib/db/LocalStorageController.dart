import 'package:localstore/localstore.dart';
import 'package:wikly/features/tasks/domain/entities/task.dart';

class LocalStorageController {
  static final db = Localstore.instance;
  static final String todoCollectionName = 'todos';

  Stream<Map<String, dynamic>> getTodoStream() {
    return db.collection(todoCollectionName).stream;
  }

  Stream<Map<String, dynamic>> getTodoStreamForDayOfWeek(int dayOfWeekIndex) {
    return getTodoStream()
        .where((event) => event['dayOfWeekIndex'] == dayOfWeekIndex);
  }

  String createTodoId() {
    return db.collection(todoCollectionName).doc().id;
  }

  TodoItem updateTodo(TodoItem item) {
    db.collection(todoCollectionName).doc(item.id).set(item.toMap());
    return item;
  }

  TodoItem createTodo(String title, int dayOfWeekIndex,
      {DateTime? date, bool done = false}) {
    final id = createTodoId();
    final item = TodoItem(
        id: id,
        title: title,
        dayOfWeekIndex: dayOfWeekIndex,
        date: date ?? DateTime.now(),
        done: done);
    db.collection('todos').doc(id).set(item.toMap());
    return item;
  }

  void deleteTodo(String id) {
    db.collection(todoCollectionName).doc(id).delete();
  }
}
