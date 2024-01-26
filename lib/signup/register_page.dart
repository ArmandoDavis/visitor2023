import 'package:flutter/material.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/pages/home/homepage.dart';
import 'package:visitors2023/signup/auth_services.dart';
import 'package:visitors2023/signup/login_page.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/constants/constants.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPassword = "";
  String fullName = "";
  String phoneNumber = "";
  bool _isLoading = false;
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
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
                    margin: EdgeInsets.only(right: 200),
                    width: 539,
                    height: 741,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
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
                                          size: 20,
                                        ),
                                        BigText(
                                          text: Constants.title,
                                          color: AppColors.mainColor,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SmallText(
                                          text: "Have an Account?",
                                          size: 16,
                                        ),
                                        InkWell(
                                          child: SmallText(
                                            text: "Sign In",
                                            color: AppColors.mainColor,
                                            size: 18,
                                          ),
                                          onTap: () => nextScreenReplace(
                                              context, LoginPage()),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                SmallText(
                                  text: "Sign Up",
                                  color: AppColors.mainColor,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SmallText(text: "Enter Full Name"),
                                SizedBox(height: 14),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Fullname',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppColors.iconColor1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return "Name cannot be null";
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      fullName = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: 
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                        validator: (value) {
                                          return RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value!)
                                              ? null
                                              : "Please Enter a valid Email";
                                        },
                                      ),
                                    ],
                                  ),
                                
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmallText(text: "Enter Phone Number"),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Phone number',
                                          prefixIcon: Icon(
                                            Icons.contact_phone,
                                            color: AppColors.iconColor1,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onChanged: (value) {},
                                        validator: (value) {
                                          return RegExp(
                                                      r"^(?:[+0]9)?[0-9]{10}$")
                                                  .hasMatch(value!)
                                              ? null
                                              : "Please enter a valid phoneNumber";
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //SizedBox(height: 30),

                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(text: "Enter Password"),
                                SizedBox(height: 10),
                                TextFormField(
                                  obscureText: true,
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
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      if (value.length < 6) {
                                        return "Password must be greater than 6 characteristics";
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return "Password cannot be empty";
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                      register();
                                    },
                                    child: SmallText(
                                        text: "Register",
                                        size: 18,
                                        color: AppColors.backgroundColor2),
                                  ),
                                ),
                              
                              ],
                            ),
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .registerUserWithEmailandPassword(
        fullName,
        email,
        phoneNumber,
        password,
      )
          .then((value) async {
        if (value == true) {
          //saving the shared preferences
          await HelperFunction.SaveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(email);
          await HelperFunction.saveUserNameSF(fullName);
          await HelperFunction.saveUserPhoneNumberSF(phoneNumber);
          nextScreenReplace(context, const HomePage());
        } else {
          showSnackBar(context, AppColors.errorColor, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
