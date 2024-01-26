import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';


// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;

  SmallText(
      {super.key,
      this.color = const Color(0xFF6A6A6A),
      required this.text,
      this.size = 0,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        color: color,
        
        fontSize: size == 0 ? Dimensions.font14(context) : size,
        height: height,
        
        overflow: TextOverflow.ellipsis,
        
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
