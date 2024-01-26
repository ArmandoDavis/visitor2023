import 'package:flutter/material.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Dimensions.width300(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width10(context),
                  right: Dimensions.width5(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Notifications",
                    size: Dimensions.font14(context),
                  ),
                  IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      icon: Icon(Icons.close))
                ],
              ),
            ),
            Divider(),
            SizedBox(height: Dimensions.height10(context)),
            SmallText(text: "No new notifications!", color: Color(0xFF3D76D8)),
            SizedBox(height: Dimensions.height10(context)),
            InkWell(
              child: SmallText(
                text: "Show all",
                color: Color(0xFF3D76D8),
                size: Dimensions.height10(context),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
