import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikly/db/LocalStorageController.dart';
import 'package:wikly/models/todo_item.dart';
import 'package:wikly/modules/newTask/NewTaskPage.dart';
import 'package:wikly/shared/components/AppTaskList/AppTaskListItem.dart';
import 'package:wikly/shared/themes/AppColors.dart';

class DayOfWeekPage extends StatefulWidget {
  final int dayOfWeekIndex;
  const DayOfWeekPage({Key? key, required this.dayOfWeekIndex})
      : super(key: key);

  @override
  _DayOfWeekPageState createState() => _DayOfWeekPageState();
}

class _DayOfWeekPageState extends State<DayOfWeekPage> {
  final _items = <String, TodoItem>{};
  final db = LocalStorageController();
  StreamSubscription<Map<String, dynamic>>? _subscription;

  void getTasksFromDatabase() {
    print('getTasksFromDatabase');

    _subscription =
        db.getTodoStreamForDayOfWeek(widget.dayOfWeekIndex).listen((event) {
      setState(() {
        var todo = TodoItem.fromMap(event);
        _items.putIfAbsent(todo.id, () => todo);
        print(event);
      });
    });
  }

  @override
  void initState() {
    getTasksFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _items.keys.length,
                itemBuilder: (context, index) {
                  final key = _items.keys.elementAt(index);
                  final item = _items[key]!;
                  return AppTaskListItem(
                      onDelete: (id) {
                        setState(() {
                          _items.remove(id);
                        });
                      },
                      todo: item);
                }),
            flex: 6,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: OutlinedButton(
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.primary,
                ),
                onPressed: () async {
                  TodoItem received = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTaskPage(
                              dayOfWeekIndex: widget.dayOfWeekIndex,
                            )),
                  );
                  setState(() {
                    _items.putIfAbsent(received.id, () => received);
                  });
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.symmetric(horizontal: 130)),
                  side: MaterialStateProperty.resolveWith(
                      (states) => BorderSide(color: AppColors.primary)),
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_subscription != null) _subscription?.cancel();
    super.dispose();
  }
}
