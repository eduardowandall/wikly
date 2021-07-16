import 'package:flutter/material.dart';
import 'package:wikly/modules/dayOfWeek/DayOfWeekPage.dart';
import 'package:wikly/modules/home/HomeController.dart';
import 'package:wikly/shared/components/AppBottomNavigationBar/AppBottomNavigationBar.dart';
import 'package:wikly/shared/components/HomeAppBar/HomeAppBar.dart';
import 'package:wikly/shared/themes/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final List<Widget> pagesOfWeek = [
    DayOfWeekPage(
      dayOfWeekIndex: 0,
      key: UniqueKey(),
    ),
    DayOfWeekPage(
      dayOfWeekIndex: 1,
      key: UniqueKey(),
    ),
    DayOfWeekPage(
      dayOfWeekIndex: 2,
      key: UniqueKey(),
    ),
    DayOfWeekPage(
      dayOfWeekIndex: 3,
      key: UniqueKey(),
    ),
    DayOfWeekPage(
      dayOfWeekIndex: 4,
      key: UniqueKey(),
    ),
  ];
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        child: HomeAppBar(),
        preferredSize: Size.fromHeight(180),
      ),
      body: Container(
        child: pagesOfWeek[controller.pageIndex],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          setIndex: (index) => {
                setState(() {
                  controller.setIndex(index);
                }),
              },
          pageIndex: controller.pageIndex),
    );
  }
}
