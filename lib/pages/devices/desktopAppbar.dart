// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitors2023/pages/devices/checkin_visitors.dart';
import 'package:visitors2023/pages/devices/checkout_page.dart';
import 'package:visitors2023/pages/devices/invited_visitor.dart';
import 'package:visitors2023/screens/notification_screen.dart';
import 'package:visitors2023/screens/personal_details_screen.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';
import 'package:visitors2023/widget/widget.dart';


class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String head;

  const DesktopAppBar({super.key, required this.head});
  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  Size get preferredSize => Size.fromHeight(50);
  // Set the preferred height of the AppBar
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          //color: Colors.white,
          child: BigText(text: widget.head, size: Dimensions.font20(context)),
        ),
        Row(
          children: [
            GestureDetector(
              child: Container(
                width: Dimensions.width100(context),
                height: Dimensions.height40(context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius8(context))),
                child: BigText(
                  text: "INVITE",
                  color: white,
                  size: Dimensions.font14(context),
                ),
              ),
              onTap: () {
                nextScreen(context, InvitedVisitors());
              },
            ),
            SizedBox(width: Dimensions.width10(context)),
            GestureDetector(
              child: Container(
                width: Dimensions.width100(context),
                height: Dimensions.height40(context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius8(context))),
                child: BigText(
                  text: "CHECKIN",
                  color: white,
                  size: Dimensions.font14(context),
                ),
              ),
              onTap: () {
                nextScreen(context, CheckInVisitors());
              },
            ),
            SizedBox(width: Dimensions.width10(context)),
            GestureDetector(
              child: Container(
                width: Dimensions.width100(context),
                height: Dimensions.height40(context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius8(context)),
                    border: Border.all(color: AppColors.mainColor)),
                child: BigText(
                  text: "CHECKOUT",
                  size: Dimensions.font14(context),
                  color: AppColors.mainColor,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        // The dialog page (CheckOutPage)
                        Center(
                          child: CheckOutPage(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(width: Dimensions.width20(context)),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: Dimensions.height20(context),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    
                    builder: (BuildContext context) {
                   return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        // The dialog page (CheckOutPage)
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: NotificationPage()),
                      ],
                    );
                    });
              
              },
            ),
            SizedBox(width: Dimensions.width10(context)),
            IconButton(
              icon: Icon(
                Icons.settings,
                size: Dimensions.height20(context),
              ),
              onPressed: () {
                // Handle settings button press
              },
            ),
            SizedBox(width: Dimensions.width10(context)),
            IconButton(
              icon: Icon(
                Icons.person,
                size: Dimensions.height20(context),
              ),
              onPressed: () {
                    showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                   return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                     child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              color: const Color.fromARGB(255, 94, 65, 65).withOpacity(0.3),
                            ),
                          ),
                          // The dialog page (CheckOutPage)
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: Dimensions.height400(context),
                            child: PersonalDetails()),
                        ],
                      ),
                   );
                    });
              
              },
            ),
          ],
        ),
      ],
    );
  }
}
