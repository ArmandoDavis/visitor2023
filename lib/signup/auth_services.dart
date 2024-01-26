import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors2023/helper/database_services.dart';
import 'package:visitors2023/pages/devices/homeMobile.dart';
import 'package:visitors2023/signup/register_login_page.dart';

class AuthServices{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   //login
  Future logginUserWithEmaiLandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        //call our database service to update the user data
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

//REGISTER
Future registerUserWithEmailandPassword (String fullName, String email, String phoneNumber, String password)async{
try {
  User user =   (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;
if (user !=null){
  //register user to the database
  await DatabaseServices(uid: user.uid).savingUserData(fullName, email);

  return true;
}
}on FirebaseAuthException catch (e) {
  return e.message;
}
}

}