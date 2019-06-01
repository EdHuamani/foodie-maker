import 'package:flutter/material.dart';

class FoodTheme {
  static get theme {
    return ThemeData(
      primaryColor: Color(0xFFA1C446),
      primaryColorLight: Color(0xFFF0F6DF),
      accentColor: Color(0xFF29B1CC),
      // iconTheme: new IconThemeData(
      //   color: Colors.grey[700],
      // ),
      backgroundColor: Color.fromRGBO(245, 247, 253, 1.0),
      bottomAppBarColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  
      ),
    );
  }
}
