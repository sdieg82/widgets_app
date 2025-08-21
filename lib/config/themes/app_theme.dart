import 'package:flutter/material.dart';

const colorList=<Color>[
   Colors.blue,
   Colors.green,
   Colors.yellow,
   Colors.red,
   Colors.purple,
];

class AppTheme {
  bool isDarkMode=false;
  final int selectedColor;
  
  AppTheme({
    this.selectedColor=0
  }):assert(
    selectedColor>=0 && selectedColor <= colorList.length
  );
ThemeData getTheme()=>ThemeData(
   brightness: isDarkMode? Brightness.light : Brightness.dark,
   useMaterial3: true,
   colorSchemeSeed: colorList[selectedColor],
   appBarTheme: const AppBarTheme(
    centerTitle: false,
   )
);
}

