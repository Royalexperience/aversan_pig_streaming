import 'package:aversan_pig_streaming/screens/avatar_picker_screen.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/themes/helping_functions.dart';
import '../utils/utils.dart';

class AvatarPickerButton extends StatefulWidget {
  static String imagePath = Utils.getUserAvatarList()[0].avatarImagePath; // Percorso dell'immagine di default
  const AvatarPickerButton({super.key});
  
  @override
  State<StatefulWidget> createState() => _ImagePickerButtoState();
}

class _ImagePickerButtoState extends State<AvatarPickerButton> {

  @override
  void initState() {
    super.initState();
    AvatarPickerButton.imagePath = Utils.getUserAvatarList()[0].avatarImagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: screenWidthPercentage(context, percentage: 0.6),
              height: screenWidthPercentage(context, percentage: 0.6),
              margin: EdgeInsets.all(screenWidthPercentage(context, percentage: 0.05)),
              decoration: BoxDecoration(
                color: COLOR_TRANSPARENT,
                border: Border.all(color: MAIN_PINK, width: 3),
                shape: BoxShape.circle,
              ),
              child: Material(
                color: WHITE,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderOnForeground: true,
                child: InkWell(
                    onTap: () async {
                      var indexImage = await Navigator.push(context, MaterialPageRoute(builder: (context) => AvatarPickerScreen()));
                      setState(() {
                        AvatarPickerButton.imagePath = Utils.getUserAvatarList()[indexImage].avatarImagePath;
                      });
                    },
                    child: Image.asset(
                      AvatarPickerButton.imagePath,
                    )
                ),
              ),
            ),
          ),
          Positioned(
            right: screenWidthPercentage(context, percentage: 0.2),
            bottom: screenWidthPercentage(context, percentage: 0.01),
            child: FloatingActionButton(
              backgroundColor: MAIN_PINK,
              onPressed: null,
              mini: true,
              enableFeedback: false,
              child: Icon(PENCIL_ICON),
            ),
          ),
        ],
      );
  }
}