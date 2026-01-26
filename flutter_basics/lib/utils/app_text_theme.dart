import 'package:flutter/material.dart';

extension AppTextTheme on TextTheme {
  TextStyle get sectionLabel => 
    titleLarge!.copyWith(fontSize: 19,
                         fontWeight: FontWeight.bold,
                         color: Colors.white);

  TextStyle get horizontalTileTitle => 
    titleLarge!.copyWith(fontSize: 14,
                         color: Colors.white);

  TextStyle get tileGenre => 
    titleLarge!.copyWith(fontSize: 14,
                         color: Colors.white54);

  TextStyle get verticalTileTitle => 
    titleLarge!.copyWith(fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color: Colors.white);                      
}
