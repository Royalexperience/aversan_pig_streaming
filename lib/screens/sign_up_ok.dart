import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/models/headings.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/widgets/pink_wave.dart';
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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: PinkWaveWidget(),
      body: CustomPaint(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Testo registrazione avvenuta con successo
                Center(
                  child: Heading1(context: context, text: SIGN_UP_OK_ITALIAN_PT1, color: GREY,),
                ),
                Center(
                  child: Heading1(context: context, text: SIGN_UP_OK_ITALIAN_PT2, color: GREY,),
                ),
                // Testo di account creato
                Container(
                  margin: EdgeInsets.only(top: marginMid(context), bottom: marginSmall(context)),
                  child: Center(
                    child: Heading2(context: context, text: ACCOUNT_HAVE_BEEN_CREATED_ITALIAN, color: GREY,),
                  ),
                ),
                // Bottone che riporta alla pagina di login
                Container(
                  margin: EdgeInsets.only(top: marginMid(context)),
                  child: RoundedButton(
                    YOUR_FIRST_ACCESS_ITALIAN, () {
                      // Rimanda alla pagina di login
                      Navigator.pushNamed(context, APSNamedRoute.signInPage,);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
