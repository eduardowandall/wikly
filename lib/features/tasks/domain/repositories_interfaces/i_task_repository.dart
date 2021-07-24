import 'package:wikly/features/tasks/domain/entities/task.dart';

abstract class ITaskRepository {
  String create(Task task);
  void update(Task task);
  void delete(String id);
  Stream<Map<String, dynamic>> getStream();
}
