import 'package:flutter/material.dart';

ThemeData darkTheme(){
  final ThemeData base= ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    secondaryHeaderColor: Colors.white10,
    primaryColor: Colors.blueGrey,
    primaryColorDark: Colors.blueGrey,
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    //onPrimary: Colors.yellow,
    primary: Colors.blueGrey,
  )),
    iconTheme: const IconThemeData(
        color: Colors.white,
    ),
  );
}

ThemeData lightTheme(){

  final ThemeData base= ThemeData.light();
  return base.copyWith(
    backgroundColor: Colors.white38,
    secondaryHeaderColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          //onPrimary: Colors.yellow,
          primary: Colors.blueGrey,
        )),
    iconTheme: const IconThemeData(
      color: Colors.black
    ),
  );

}