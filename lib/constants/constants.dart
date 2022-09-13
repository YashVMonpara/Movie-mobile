import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF12153D);
const Color secondaryColor = Color(0xFF434670);
const Color blackColor = Colors.black;
const Color pinkColor = Color(0xFFFE6D8E);
const Color greenColor = Color(0xFF51CF66);
const Color whiteColor = Colors.white;
Color grayColor = Colors.grey.withOpacity(0.5);

TextStyle fontstyleBold({
  double fontSize = 32,
  Color color = blackColor,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w600,
  );
}

TextStyle fontstyleSemiBold({
  double fontSize = 32,
  Color color = blackColor,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w500,
  );
}

TextStyle fontstyleMedium({
  double fontSize = 12,
  Color color = blackColor,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w400,
  );
}

List<String> tabBarTitles = [
  "In Theater",
  "Box Office",
  "Coming Soon",
];
List<String> movieTypes = [
  "Action",
  "Crime",
  "Comedy",
  "Drama",
];
