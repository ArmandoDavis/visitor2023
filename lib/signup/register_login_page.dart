import 'package:flutter/material.dart';
import 'package:visitors2023/signup/login_page.dart';
import 'package:visitors2023/signup/register_page.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/widget.dart';


class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 163,
              height: 37,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor2,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  nextScreen(context, LoginPage());
                },
                child: SmallText(text: "Login"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 163,
              height: 37,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor2,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  nextScreen(context, RegisterPage());
                },
                child: SmallText(text: "Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
