import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/margins.dart';

class SignUpOk extends StatelessWidget {
  const SignUpOk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(COLOR_TRANSPARENT, WHITE),
      bottomNavigationBar: BottomAppBar(
        color: COLOR_TRANSPARENT,
        elevation: 0,
        child: WaveWidget(
          duration: 1,
          config: CustomConfig(
            gradients: [
              [MAIN_PINK, GREY],
              [MAIN_PINK, GREY],
              [MAIN_PINK, GREY],
              [MAIN_PINK, GREY]
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.10, 0.13, 0.15, 0.20],
            blur: MaskFilter.blur(BlurStyle.inner, 5),
            gradientBegin: Alignment.centerRight,
            gradientEnd: Alignment.centerLeft,
          ),
          waveAmplitude: 1.0,
          size: Size(double.infinity, 200.0),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        //painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    SIGN_UP_OK_ITALIAN_PT1,
                    style: TextStyle(
                      fontSize: fontSizeHuge(context),
                      color: GREY,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    SIGN_UP_OK_ITALIAN_PT2,
                    style: TextStyle(
                      fontSize: fontSizeHuge(context),
                      color: GREY,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)
                  ),
                  child: Center(
                    child: Text(
                      ACCOUNT_HAVE_BEEN_CREATED_ITALIAN,
                      style: TextStyle(
                        fontSize: fontSizeMid(context),
                        color: GREY,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: marginSmall(context)
                  ),
                  child: RoundedButton(
                      YOUR_FIRST_ACCESS_ITALIAN, () {}, MAIN_PINK, WHITE),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}