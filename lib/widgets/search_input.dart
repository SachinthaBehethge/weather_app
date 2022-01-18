import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/text_styles.dart';

class SearchInput extends StatelessWidget {
  Function onPress;
  TextEditingController controller;

  SearchInput({this.onPress, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: AppColors.lightGrey),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                style: inputTextStyle(),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintStyle: inputTextStyle(),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "City name.."),
              ),
            ),
            GestureDetector(
              onTap: onPress,
              child: Icon(Icons.search, color: AppColors.darkerGrey),
            )
          ],
        ));
  }
}
