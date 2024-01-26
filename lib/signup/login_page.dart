import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visitors2023/helper/database_services.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/pages/home/homepage.dart';
import 'package:visitors2023/signup/auth_services.dart';
import 'package:visitors2023/signup/forgot_password_page.dart';
import 'package:visitors2023/signup/register_page.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/constants/constants.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';
import 'package:visitors2023/widget/widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : Stack(
              children: [
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
                    margin:
                        EdgeInsets.only(right: Dimensions.width200(context)),
                    width: Dimensions.width540(context),
                    height: Dimensions.height740(context),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height40(context)),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.width20(context),
                                right: Dimensions.width20(context),
                                top: Dimensions.height30(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SmallText(
                                          text: "Welcome to\t",
                                          size: Dimensions.height20(context),
                                        ),
                                        BigText(
                                          text: Constants.title,
                                          color: AppColors.mainColor,
                                          size: Dimensions.font18(context),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SmallText(
                                          text: "No Account?",
                                          size: Dimensions.height15(context),
                                        ),
                                        InkWell(
                                          child: SmallText(
                                            text: "Sign Up",
                                            color: AppColors.mainColor,
                                            size: Dimensions.font18(context),
                                          ),
                                          onTap: () => nextScreenReplace(
                                              context, RegisterPage()),
                                        )
                                        
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: Dimensions.height10(context)),
                                SmallText(
                                  text: "Sign In",
                                  color: AppColors.mainColor,
                                  size: Dimensions.height40(context),
                                ),
                                SizedBox(height: 80),
                                SmallText(text: "Enter Email Address"),
                                SizedBox(height: 14),
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
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!)
                                        ? null
                                        : "Please Enter a valid Email";
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 48),
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(text: "Enter Password"),
                                SizedBox(height: 14),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: AppColors.iconColor1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.length < 6) {
                                      return ("Password must be greater than 6 characteristics");
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20, top: 10),
                                  child: Text.rich(
                                    TextSpan(
                                      text: ("Forgot Password?"),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.iconColor1),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          nextScreen(context, ForgotPassword());
                                        },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 236,
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mainColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    login();
                                  },
                                  child: SmallText(
                                    text: "Login",
                                    size: 18,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .logginUserWithEmaiLandPassword(email, password)
          .then((value) async {
        //retrieving the values
        QuerySnapshot snapshot =
            await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(email);

        //saving the values to our shared preferences
        await HelperFunction.SaveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(email);
        await HelperFunction.saveUserNameSF(snapshot.docs[0]['fullName']);

        nextScreenReplace(context, HomePage());
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
