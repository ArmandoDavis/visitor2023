import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  //keys data we are saving and getting
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhoneNumberKey = "USERPHONENUMBER";

  //Saving data to SF
  // ignore: non_constant_identifier_names
  static Future<bool> SaveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    return await sf.setString(userEmailKey, email);
  }

  static Future<bool> saveUserPhoneNumberSF(String phoneNumber) async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    return await sf.setString(userPhoneNumberKey, phoneNumber);
  }

  //Getting data from SF
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserPhoneNumberSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPhoneNumberKey);
  }
}
