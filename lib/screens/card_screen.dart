import 'package:flutter/material.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';


class CardContainer extends StatelessWidget {
  final Color color;
  final String title;
  final int number;

  CardContainer({required this.color, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Dimensions.width300(context), 
        height: Dimensions.height150(context),// Set the width of each card container
        margin: EdgeInsets.all(Dimensions.height10(context)),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
        ),
        child: Padding(
          padding:  EdgeInsets.all(Dimensions.height10(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(text:title),
              SizedBox(height: Dimensions.height5(context)),
              Container(
                width: Dimensions.width10(context),
                height: Dimensions.height3(context),
                color: color,
              ),
              SizedBox(height: Dimensions.height10(context)),
              Center(child: Text(number.toString()))
            ],
          ),
        )
      ),
    );
  }
}