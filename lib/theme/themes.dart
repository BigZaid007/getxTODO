import 'package:flutter/material.dart';

class Themes
{
  static final dark=ThemeData(
    brightness: Brightness.dark,
    //cardColor: Color(0xff121212), //menu color
    accentColor: Color(0xffbb86fc), //button color
    primaryColor: Color(0xff121212).withOpacity(0.3),
    cardTheme: CardTheme(
      color: Color(0xff121212)
    ),






  );

  static final light=ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.black,
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black)
    )
    // primaryColor: Colors.red,
    // buttonColor: Colors.red,
    // cardColor: Colors.red,
    // accentColor: Colors.red


  );


}