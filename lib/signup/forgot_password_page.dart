import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/small_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link sent! Check your email"),
          );
        },
      ).then((value) => Navigator.of(context).pop());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          }).then((value) => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/home.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 200),
            width: 539,
            height: 741,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SmallText(
                        text:
                            "Enter your email and we will send you a password reset link"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SmallText(text: "Enter Email Address"),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.iconColor1,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _emailController,
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 236,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        passwordReset();
                      },
                      child: SmallText(
                          text: "Reset Password",
                          size: 16,
                          color: AppColors.backgroundColor2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
