import 'package:aversan_pig_streaming/api/google_sign_in_api.dart';
import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/models/user_login.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/screens/home.dart';
import 'package:aversan_pig_streaming/widgets/google_icons_icons.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import '../widgets/circles_in_login_page.dart';

// Schermata principale
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: Circle(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Immagine principale
            Image.asset(IMAGE_PIG_HD_2_PATH),
            // Blocco "Hai già un acount?"
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      ALREADY_ACCOUNT_ITALIAN,
                      style: TextStyle(
                        fontSize: FONT_SIZE_MID,
                        color: GREY,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      LOGIN,
                      style: TextStyle(fontSize: FONT_SIZE_MID, color: MAIN_PINK),
                    ),
                    onTap: () {
                      // Rimanda alla schermata di login
                      Navigator.pushNamed(context, APSNamedRoute.signInPage,);
                    },
                  )
                ],
              ),
            ),
            // Bottone registrazione
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: RoundedButton(SIGN_UP_WEMAIL_ITALIAN, () {
                  // Rimanda alla pagina di registrazione
                  Navigator.pushNamed(context, APSNamedRoute.signUpPage,);
                },)
            ),
            // Bottone custom per l'accesso con google
            RoundendButtonWithIcon(
              SIGN_UP_WGOOGLE_ITALIAN, 
              (){
                _signIn(context);
              }, 
              color: WHITE,
              textColor: MAIN_BLACK, 
              GoogleIcons.google, MAIN_BLACK
            ),
          ],
        ),
      )
    );
  }

  Future<void> _signIn(BuildContext context) async {
    final userPage = await GoogleSignInAPI.login();
    UserLogin userLogin = UserLogin(userPage!.email, userPage.displayName!);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(user: userLogin)));
  }
}

