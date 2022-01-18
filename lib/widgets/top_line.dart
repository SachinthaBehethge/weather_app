import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_colors.dart';

class TopLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 6.0,
          width: 40.0,
          decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
        Container(
          height: 3.0,
          width: 80.0,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        )
      ],
    );
  }
}
