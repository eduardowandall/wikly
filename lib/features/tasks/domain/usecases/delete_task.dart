import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';

class DeleteTask {
  final ITaskRepository repository;
  DeleteTask(
    this.repository,
  );

  Future call(String id) async {
    repository.delete(id);
  }
}
