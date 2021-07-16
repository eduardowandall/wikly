import 'package:flutter/material.dart';
import 'package:wikly/shared/components/AppBottomNavigationBar/AppBottomNavigationBarItem.dart';
import 'package:wikly/shared/themes/AppColors.dart';
import 'package:wikly/shared/themes/AppTextStyles.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Function setIndex;
  final int pageIndex;
  const AppBottomNavigationBar(
      {Key? key, required this.setIndex, required this.pageIndex})
      : super(key: key);

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.background,
      currentIndex: widget.pageIndex,
      onTap: (int index) {
        setState(() {
          widget.setIndex(index);
        });
        // _navigateToScreens(index);
      },
      unselectedLabelStyle: AppTextStyles.bottomMenuButton,
      selectedLabelStyle: AppTextStyles.bottomMenuButton,
      showUnselectedLabels: true,
      items: [
        AppBottomNavigationBarItem(label: "Seg", tooltip: "Segunda-feira"),
        AppBottomNavigationBarItem(label: "Ter", tooltip: "Terça-feira"),
        AppBottomNavigationBarItem(label: "Qua", tooltip: "Quarta-feira"),
        AppBottomNavigationBarItem(label: "Qui", tooltip: "Quinta-feira"),
        AppBottomNavigationBarItem(label: "Sex", tooltip: "Sexta-feira"),
      ],
    );
  }
}
