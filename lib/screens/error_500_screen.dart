import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/models/headings.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/margins.dart';

class Error500Screen extends StatelessWidget {
  const Error500Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(COLOR_TRANSPARENT, WHITE),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Testo registrazione avvenuta con successo
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Heading1(context: context, text: "Ooops... Sembra che", color: GREY,),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: marginMid(context)),
                  child: Center(
                    child: Heading1(context: context, text: "qualcosa è andato storto.", color: GREY,),
                  ),
                ),
                // Testo di account creato
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Heading2(context: context, text: "C'è stato un errore improvviso e siamo ", color: GREY,),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Heading2(context: context, text: "a lavoro per risolverlo! Il servizio sarà", color: GREY,),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: marginSmall(context)),
                  child: Center(
                    child: Heading2(context: context, text: "disponibile a breve.", color: GREY,),
                  ),
                ),
                Image.asset(ERROR_500_IMAGE_PATH, scale: screenHeightPercentage(context, percentage: 0.0015),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
