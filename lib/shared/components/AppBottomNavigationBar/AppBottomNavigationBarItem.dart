import 'package:flutter/material.dart';
import 'package:wikly/shared/themes/AppColors.dart';

class AppBottomNavigationBarItem extends BottomNavigationBarItem {
  AppBottomNavigationBarItem({String? label, String? tooltip})
      : super(
            icon: Icon(Icons.calendar_today_outlined),
            backgroundColor: AppColors.background,
            label: label,
            tooltip: tooltip);
}
