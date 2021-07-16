import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikly/db/LocalStorageController.dart';
import 'package:wikly/models/todo_item.dart';
import 'package:wikly/shared/themes/AppColors.dart';
import 'package:wikly/shared/themes/AppTextStyles.dart';

class AppTaskListItem extends StatefulWidget {
  final TodoItem todo;
  final Function onDelete;
  const AppTaskListItem({Key? key, required this.onDelete, required this.todo})
      : super(key: key);

  @override
  _AppTaskListItemState createState() => _AppTaskListItemState();
}

class _AppTaskListItemState extends State<AppTaskListItem> {
  final todoIcon = Icon(
    FontAwesomeIcons.circle,
    size: 28,
    color: AppColors.primary,
  );
  final completedIcon = Icon(
    FontAwesomeIcons.checkCircle,
    size: 28,
    color: AppColors.primary,
  );
  @override
  Widget build(BuildContext context) {
    final db = LocalStorageController();
    return Card(
      child: ListTile(
        title: Text(
          widget.todo.title,
          style: widget.todo.done
              ? AppTextStyles.itemCompleted
              : AppTextStyles.item,
        ),
        leading: IconButton(
          onPressed: () {
            widget.todo.done = !widget.todo.done;
            db.updateTodo(widget.todo);
            setState(() {});
          },
          icon: widget.todo.done ? completedIcon : todoIcon,
        ),
        trailing: IconButton(
            onPressed: () {
              db.deleteTodo(widget.todo.id);
              widget.onDelete(widget.todo.id);
            },
            icon: Icon(
              FontAwesomeIcons.trash,
              color: AppColors.primary,
            )),
        contentPadding: EdgeInsets.all(20),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.primary)),
      color: AppColors.background,
      margin: EdgeInsets.only(left: 20, right: 20, top: 7),
    );
  }
}
