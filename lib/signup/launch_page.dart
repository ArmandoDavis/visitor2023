import 'package:flutter/material.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/pages/home/homepage.dart';
import 'package:visitors2023/signup/register_login_page.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';


class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  bool _isSignedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
    _isSignedIn
        ? Future.delayed(
            Duration(seconds: 1),
            (() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            }),
          )
        : Future.delayed(
            Duration(seconds: 1),
            (() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginRegisterPage()));
            }),
          );
  }

  getUserLoggedInStatus() async {
    HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: BigText(
          text: "VISITORS MANAGEMENT SYSTEM",
          size: 24,
          color: AppColors.textColor1,
        ),
      ),
    );
  }
}
