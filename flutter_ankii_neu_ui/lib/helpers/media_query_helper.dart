import 'package:flutter/material.dart';

class MediaQueryHelper{
  static double safeTopPadding(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }
  static double safeBottomPadding(BuildContext context){
    return MediaQuery.of(context).padding.bottom;
  }

  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}