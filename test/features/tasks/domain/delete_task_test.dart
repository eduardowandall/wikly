import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wikly/features/tasks/domain/repositories_interfaces/i_task_repository.dart';
import 'package:wikly/features/tasks/domain/usecases/delete_task.dart';

import 'task_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  var repo = MockITaskRepository();
  var usecase = DeleteTask(repo);
  var tId = 't3st1_id';

  test('should delete task by id', () async {
    await usecase(tId);

    verify(repo.delete(tId));
    verifyNoMoreInteractions(repo);
  });
}
