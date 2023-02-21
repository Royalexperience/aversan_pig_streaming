import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
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
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Testo registrazione avvenuta con successo
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
                // Margine per creare lo spazio
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)
                  ),
                ),
                // Testo di account creato
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
                // Bottone che riporta alla pagina di login
                Container(
                  margin: EdgeInsets.only(
                      top: marginSmall(context)
                  ),
                  child: RoundedButton(
                      YOUR_FIRST_ACCESS_ITALIAN, () {
                        // Rimanda alla pagina di login
                        Navigator.pushNamed(context, APSNamedRoute.signInPage,);
                      },),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}