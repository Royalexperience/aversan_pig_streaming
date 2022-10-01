import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/darkColorScheme.dart';
import 'package:aversan_pig_streaming/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/icon1x.png'),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Aversan Pig Streaming",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
              child: Text(
            "Streaming like a pig",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          )),
          SizedBox(height: 45),
          Center(
            child: Text(
              "Hai già un account?",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          Text("Log in",
              style: TextStyle(
                color: MAIN_PINK,
              )),
          SizedBox(height: 45),
          RoundedButton(SIGN_UP_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
          SizedBox(height: 20),
          RoundedButton(SIGN_UP_WGOOGLE_ITALIAN, () {}, GRAY, WHITE),
        ],
      ),
    );
  }
}
