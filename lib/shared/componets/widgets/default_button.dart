import 'package:flutter/material.dart';

Widget defaultButton({
  double width = 330.0,
  double height = 50.0,
  Color backgroundColor = Colors.black,
  double radius = 30.0,
  double fontSize = 22.0,
  Color textColor = Colors.white,
  FontWeight fontWeight = FontWeight.normal,
  bool isUpperCase = true,
  required Function function,
  required String text,
}) => Container(
  height: height,
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(
      radius,
    ),
    color: backgroundColor,
  ),
  child: MaterialButton(
    onPressed: (){
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    ),
  ),
);