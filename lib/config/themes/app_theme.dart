import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.red,
  Colors.purple,
];

class AppTheme {
  final bool isDarkMode;
  final int selectedColor;

  AppTheme({this.selectedColor = 0, this.isDarkMode = true})
    : assert(selectedColor >= 0 && selectedColor <= colorList.length);
  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({
    bool? isDarkMode,
    int? selectedColor,
  }
  )=> AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}
