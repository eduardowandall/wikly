import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikly/shared/themes/AppColors.dart';
import 'package:wikly/shared/themes/AppTextStyles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Icon(
                  FontAwesomeIcons.solidCalendarCheck,
                  color: AppColors.primary,
                  size: 125,
                ),
              ),
              Text(
                "Plan your week",
                style: AppTextStyles.titleHome,
              ),
              Text(
                "day by day",
                style: AppTextStyles.titleHome,
              )
            ],
          ),
        ),
      ),
    );
  }
}
