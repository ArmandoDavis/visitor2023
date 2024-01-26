import 'package:flutter/widgets.dart';

class Dimensions {
  // Login Page
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;
  static double width540(BuildContext context) => screenWidth(context)/3.43;
  static double height740(BuildContext context) => screenHeight(context)/1.319;
    static double height80(BuildContext context) => screenHeight(context)/12.2;



  static double imageContainerHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 1.6235;
  static double imageContainerWidth(BuildContext context) =>
      screenWidth(context) / 3.657;

//height 976
//width 1854
  static double height100(BuildContext context) =>
      screenHeight(context) / 9.76;
      static double height700(BuildContext context) => screenHeight(context)/1.39;
  static double height15(BuildContext context) => screenHeight(context) / 65.1;
  static double height150(BuildContext context) => screenHeight(context) / 6.51;
  static double height400(BuildContext context) => screenHeight(context) /  2.44;
  static double height10(BuildContext context) => screenHeight(context) / 97.6;
  static double height5(BuildContext context) => screenHeight(context) / 195.2;
  static double height20(BuildContext context) => screenHeight(context) / 48.8;
  static double height50(BuildContext context) =>
      screenHeight(context) / 19.52;
  static double height30(BuildContext context) => screenHeight(context) / 32.53;
  static double height40(BuildContext context) =>
      screenHeight(context) / 24.4;

  static double width50(BuildContext context) => screenWidth(context) / 37.08;
  static double width30(BuildContext context) => screenWidth(context) / 61.8;
  static double width300(BuildContext context) => screenWidth(context) / 6.18;
  static double width700(BuildContext context) => screenWidth(context) / 2.65;
  static double width20(BuildContext context) => screenWidth(context) / 92.7;
  static double width5(BuildContext context) => screenWidth(context) / 370.8;
  static double width10(BuildContext context) => screenWidth(context) / 185.4;
  static double width100(BuildContext context) => screenWidth(context) / 18.54;

  static double radius60(BuildContext context) =>
      screenHeight(context) / 16.27;
  static double radius20(BuildContext context) => screenHeight(context) / 48.8;
  static double radius8(BuildContext context) => screenHeight(context) / 122;

  //home desktop
  static double height60(BuildContext context) =>
      screenHeight(context) / 16.27;
  static double height200(BuildContext context) =>
      screenHeight(context) / 4.88;
  static double radius25(BuildContext context) =>
      screenHeight(context) / 39.04;

  //visitors list
  static double height600(BuildContext context) =>
      screenHeight(context) / 1.63;
  static double height3(BuildContext context) => screenHeight(context) / 325.33;
  static double radius10(BuildContext context) => screenHeight(context) / 97.6;

  //fonts
  static double font20(BuildContext context) => screenHeight(context) / 48.8;
  static double font14(BuildContext context) => screenHeight(context) / 69.71;
  static double font18(BuildContext context) => screenHeight(context)/54.22;
  static double font24(BuildContext context) => screenHeight(context) / 40.67;

  //invited visitors
  static double height800(BuildContext context) => screenHeight(context)/1.22;
  static double width15(BuildContext context) => screenWidth(context)/123.6;
   static double width150(BuildContext context) => screenWidth(context)/12.36;
   static double width130(BuildContext context) => screenWidth(context)/14.26;
   static double width200(BuildContext context) => screenWidth(context)/9.27;

  //LoginPage
}
