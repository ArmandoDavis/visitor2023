import 'package:flutter/material.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: Dimensions.font14(context),
      ),
    ),
    backgroundColor: primary,
    duration: Duration(seconds: 20),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: textColor,
    ),
  ));
}
