import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';

class UpdateTask {
  final ITaskRepository repository;
  UpdateTask(
    this.repository,
  );

  Future<Task> call(Task task) async {
    if (task.id == null) throw new ArgumentError.notNull('id');
    repository.update(task);
    return task;
  }
}
