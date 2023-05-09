import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/models/user_login.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final UserLogin user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(COLOR_TRANSPARENT, WHITE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[ 
          Container(
            alignment: Alignment.center,
            child: Text(
            'Hello ${user.email}', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: WHITE, ),
          ),
          ),
        ],
      ),
    );
  }
}