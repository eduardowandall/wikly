import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';
import 'package:wikly/features/tasks/domain/usecases/create_task.dart';

import 'task_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  final repo = MockITaskRepository();
  final usecase = CreateTask(repo);

  final tTask = Task(
    title: 'test task',
    date: DateTime.now(),
    dayOfWeekIndex: 0,
  );

  final tId = 't3st1_id';

  test('should create a task and generate an id', () async {
    // arrange
    when(repo.create(any)).thenReturn(tId);
    // act
    final result = await usecase(tTask);
    // assert
    expect(result, tTask);
    expect(result.id, tId);
    verify(repo.create(tTask));
    verifyNoMoreInteractions(repo);
  });
}
