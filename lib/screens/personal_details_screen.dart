import 'package:flutter/material.dart';
import 'package:visitors2023/signup/login_page.dart';
import 'package:visitors2023/signup/register_login_page.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';
import 'package:visitors2023/widget/widget.dart';
class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: EdgeInsets.all(5),
        width: Dimensions.width300(context),
        height: Dimensions.height150(context),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust to your content
          children: [
            Row(
              children: [
                Text("Business code:"),
                Text(("ye45")),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("User Name:"),
                Text(("Armando Davis")),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("LogOut:"),
                IconButton(
                  onPressed: (() {
                    nextScreenReplace(context, LoginPage());
                  }),
                  icon: Icon(Icons.exit_to_app),
                ),
              ],
            ),
                        Divider(),
          ],
        ),
      ),
    );
  }
}


