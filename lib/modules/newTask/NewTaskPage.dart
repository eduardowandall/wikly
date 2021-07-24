import 'package:flutter/material.dart';
import 'package:wikly/db/LocalStorageController.dart';
import 'package:wikly/features/tasks/domain/entities/task.dart';
import 'package:wikly/shared/themes/AppColors.dart';
import 'package:wikly/shared/themes/AppTextStyles.dart';

class NewTaskPage extends StatelessWidget {
  final int dayOfWeekIndex;
  const NewTaskPage({Key? key, required this.dayOfWeekIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = LocalStorageController();
    TodoItem? item;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: TextField(
          autofocus: true,
          style: AppTextStyles.inputBold,
          cursorColor: AppColors.input,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Untitled',
              hintStyle: AppTextStyles.inputHintBold),
          // onChanged: (value) {
          //   if (item != null)
          //     db.updateTodo(item!);
          //   else
          //     item = db.createTodo(value, dayOfWeekIndex);
          // },
          onSubmitted: (value) {
            if (item != null)
              db.updateTodo(item!);
            else
              item = db.createTodo(value, dayOfWeekIndex);
            Navigator.pop(context, item);
          },
        ),
      ),
    );
  }
}
