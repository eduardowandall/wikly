import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';
import 'package:wikly/features/tasks/domain/usecases/delete_task.dart';

import 'task_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  var repo = MockITaskRepository();
  var usecase = GetStreamTask(repo);
  var tId = 't3st1_id';
  var tTask = Task(
    id: tId,
    title: 'test title',
    date: DateTime.now(),
    dayOfWeekIndex: 0,
  );
  test('should get a stream of all tasks', () async {
    when(repo.getStream().first).thenAnswer((realInvocation) => Future.value(
        Map<String, dynamic>.fromEntries(
            [MapEntry('id', tId), MapEntry('item', tTask)])));
    var result = await usecase.GetStreamOfAll();

    verify(repo.getStream());
    verifyNoMoreInteractions(repo);
  });
}
