import 'package:flutter/material.dart';

///Possiblité de changer de thème : Dark et Light
ThemeData darkTheme(){
  TextTheme _baseTextTheme(TextTheme base){
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: 'MerriWeather',
        fontSize: 22.0,
        color: Colors.white,
      )
    );
  }
  final ThemeData base= ThemeData.dark();
  return base.copyWith(
    textTheme: _baseTextTheme(base.textTheme),
    brightness: Brightness.dark,
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
  TextTheme _baseTextTheme(TextTheme base){
    return base.copyWith(
        headline1: base.headline1!.copyWith(
          fontFamily: 'MerriWeather',
          fontSize: 22.0,
          color: Colors.black,
        )
    );
  }
  final ThemeData base= ThemeData.light();
  return base.copyWith(
    textTheme: _baseTextTheme(base.textTheme),
    backgroundColor: Colors.white38,
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