import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

TextStyle inputTextStyle() {
  return TextStyle(color: AppColors.darkerGrey, fontSize: 16);
}

TextStyle cityNameTextStyle() {
  return TextStyle(
      color: AppColors.orange, fontSize: 35, fontWeight: FontWeight.bold);
}

TextStyle weatherBoldTextStyle() {
  return TextStyle(
      color: AppColors.orange, fontSize: 76, fontWeight: FontWeight.w900);
}

TextStyle weatherMainTextStyle() {
  return TextStyle(
      color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w600);
}

TextStyle weatherDescriptionTextStyle() {
  return TextStyle(
      color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w500);
}
