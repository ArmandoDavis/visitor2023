import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/signup/auth_services.dart';
import 'package:visitors2023/signup/launch_page.dart';
import 'package:visitors2023/signup/login_page.dart';
import 'package:visitors2023/signup/register_login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:visitors2023/widget/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: Constants.apiKey,
          appId: Constants.appId,
          messagingSenderId: Constants.messagingSenderId,
          projectId: Constants.projectId),
    );
    runApp(const MyApp());
  } else {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCrXapqYnmWzW5ku8OWsMZKAAcT0iFR_GA",
            appId: "1:1004949614041:android:feb8212480134efcfabdc8",
            messagingSenderId: "1004949614041",
            projectId: "visitors2023-52f7d"));
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
