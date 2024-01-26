import 'package:flutter/material.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';


class VisitorsList extends StatelessWidget {
  final String heading;
  final String title;
  final String host;
  final String purpose;
  const VisitorsList({
    super.key,
    required this.title,
    required this.host,
    required this.purpose,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: 500,
        height: Dimensions.height600(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius8(context)), color: Color(0xFFFFFDFD)),
        child: Padding(
          padding:  EdgeInsets.all(Dimensions.height10(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading),
              SizedBox(height: Dimensions.radius8(context)),
              Container(
                width: Dimensions.width30(context),
                height: Dimensions.height3(context),
                color: Color(0xFF454242),
              ),
              SizedBox(height: Dimensions.height20(context)),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.width20(context), top: Dimensions.height10(context)),
                child: Column(
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height20(context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFF7F1F1),
                            radius: Dimensions.height40(context),
                            child: Icon(Icons.person,
                                color: Colors.grey, size: Dimensions.height50(context)),
                          ),
                          SizedBox(width:  Dimensions.width30(context)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text:title,
                              color: Color(0xFF2186B8),
                              size: Dimensions.font18(context),
                                 ),
                                 SizedBox(height: Dimensions.height5(context)),
                              SmallText(text:host,size: Dimensions.font14(context)),
                              SizedBox(height: Dimensions.height5(context)),
                              SmallText(text:purpose, size:Dimensions.font14(context),),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
