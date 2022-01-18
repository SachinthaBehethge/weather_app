import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_colors.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0,
      width: MediaQuery.of(context).size.width / 100 * 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: AppColors.lightGrey),
    );
  }
}
