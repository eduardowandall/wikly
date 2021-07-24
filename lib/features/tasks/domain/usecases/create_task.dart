import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';

class CreateTask {
  final ITaskRepository repository;
  CreateTask(
    this.repository,
  );

  Future<Task> call(Task task) async {
    final id = repository.create(task);
    task.id = id;
    return task;
  }
}
