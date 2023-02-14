import 'package:aversan_pig_streaming/screens/home.dart';
import 'package:aversan_pig_streaming/screens/sign_in.dart';
import 'package:aversan_pig_streaming/screens/password_recovery.dart';
import 'package:aversan_pig_streaming/screens/sign_up.dart';
import 'package:aversan_pig_streaming/screens/sign_up_ok.dart';
import 'package:flutter/material.dart';

class APSNamedRoute {
  static const String signInPage = 'signIn';
  static const String signUpPage = 'signUp';
  static const String signUpOkPage = 'signUpOk';
  static const String homePage = 'home';
  static const String forgotPasswordPage = 'forgotPassword';

  // Control our page route flow
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case signInPage:
        return MaterialPageRoute(builder: (context) => SignInPage());
      case signUpPage:
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case signUpOkPage:
        return MaterialPageRoute(builder: (context) => SignUpOk());
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (context) => PasswordRecovery());
      default:
        throw('This route name does not exit');
    }
  }
}