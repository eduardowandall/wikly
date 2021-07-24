import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';
import 'package:wikly/features/tasks/domain/usecases/update_task.dart';

import 'task_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  var repo = MockITaskRepository();
  var usecase = UpdateTask(repo);

  var tTitle = 'test task';
  var tTitleUpdated = 'updated test task';
  var tId = 't3st1_id';
  var tTask = Task(
    id: tId,
    title: tTitle,
    date: DateTime.now(),
    dayOfWeekIndex: 0,
  );

  test('should throw argument null error when trying to update task without id',
      () async {
    // arrange
    tTask = Task(
      title: tTitle,
      date: DateTime.now(),
      dayOfWeekIndex: 0,
    );

    expect(() => usecase(tTask), throwsArgumentError);
    verifyNoMoreInteractions(repo);
  });

  test('should update task name and return updated object', () async {
    // arrange
    tTask = Task(
      id: tId,
      title: tTitle,
      date: DateTime.now(),
      dayOfWeekIndex: 0,
    );

    expect(tTask.title, tTitle);

    // act
    tTask.title = tTitleUpdated;
    final result = await usecase(tTask);

    expect(result.title, tTitleUpdated);
    expect(result, tTask);
    expect(result.id, tId);
    verify(repo.update(tTask));
    verifyNoMoreInteractions(repo);
  });
}
