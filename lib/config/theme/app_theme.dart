import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle:  true,
    iconTheme: IconThemeData(color: Colors.yellowAccent.shade200),
    titleTextStyle: TextStyle(color: Colors.amber, fontSize: 18),
  );
}
