import 'package:flutter/cupertino.dart';

class AppSizes {
  static const paddingBody=16;
  static const radius=10;

  static const iconSmall=16;
  static const iconMedium=20;
  static const iconsLarge=24;

  static double height(context, double value)=>MediaQuery.sizeOf(context).height*(value/900);
  static double width(context ,double value)=>MediaQuery.sizeOf(context).width*(value/300);

}