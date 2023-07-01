import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFF7A000);
Color secondaryColor = primaryColor.withOpacity(0.5);

String _assetPath = "assets/";
String logoImage = "${_assetPath}title_logo.jpg";

InputDecoration addTodoTextFieldDecoration = InputDecoration(
  hintText: "Buy groceries...",
  border: inputBorder,
  enabledBorder: inputBorder,
  focusedBorder: focusedBorder,
  focusColor: primaryColor,
  fillColor: primaryColor,
  hoverColor: primaryColor,
);


OutlineInputBorder inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(width: 1, color: Colors.grey),
  borderRadius: BorderRadius.circular(12),
);

OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: primaryColor),
  borderRadius: BorderRadius.circular(12),
);
