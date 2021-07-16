import 'package:flutter/material.dart';
import 'package:wikly/shared/themes/AppTextStyles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Center(
        child: ListTile(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "You have ",
              style: AppTextStyles.titleHome,
              children: [
                TextSpan(
                  text: "3",
                  style: AppTextStyles.titleHomeBold,
                ),
                TextSpan(
                  text: " tasks on this ",
                ),
                TextSpan(
                  text: "Wednesday",
                  style: AppTextStyles.titleHomeBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
