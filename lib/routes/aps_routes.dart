import 'package:aversan_pig_streaming/screens/error_500_screen.dart';
import 'package:aversan_pig_streaming/screens/welcome.dart';
import 'package:aversan_pig_streaming/screens/sign_in.dart';
import 'package:aversan_pig_streaming/screens/password_recovery.dart';
import 'package:aversan_pig_streaming/screens/sign_up.dart';
import 'package:aversan_pig_streaming/screens/sign_up_ok.dart';
import 'package:flutter/material.dart';

//Questa classe permette di gestire il routing tra le varie schermate 
//dell'applicazione.
class APSNamedRoute {
  // Nomi delle varie schermate
  static const String homePage = 'home';
  static const String signInPage = 'signIn';
  static const String signUpPage = 'signUp';
  static const String signUpOkPage = 'signUpOk';
  static const String welcomePage = 'welcome';
  static const String forgotPasswordPage = 'forgotPassword';
  static const String avatarPickerScreen = 'avatarPickerScreen';
  static const String error500Screen = 'error500Screen';
  // Controllo del flusso delle schermate
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case signInPage:
        return MaterialPageRoute(builder: (context) => SignInPage());
      case signUpPage:
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case signUpOkPage:
        return MaterialPageRoute(builder: (context) => SignUpOk());
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (context) => PasswordRecoveryPage());
      case error500Screen:
        return MaterialPageRoute(builder: (context) => Error500Screen());
      default:
        throw('This route name does not exit');
    }
  }
}