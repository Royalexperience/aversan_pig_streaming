import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/themes/helping_functions.dart';
import '../utils/utils.dart';

class ImagePickerButton extends StatefulWidget {
  static String imagePath = Utils.getUserAvatarList()[0].avatarImagePath;
  final Widget nextScreen;
  const ImagePickerButton( this.nextScreen, {super.key});
  
  @override
  State<StatefulWidget> createState() => _ImagePickerButtoState();
}

class _ImagePickerButtoState extends State<ImagePickerButton> {
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
                      var indexImage = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => widget.nextScreen));
                      ImagePickerButton.imagePath = Utils.getUserAvatarList()[indexImage].avatarImagePath;
                      setState(() {});
                    },
                    child: Image.asset(
                      ImagePickerButton.imagePath,
                    )),
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