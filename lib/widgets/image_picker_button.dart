import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/themes/helping_functions.dart';

class ImagePickerButton extends StatelessWidget {
  final String imagePath;
  final Widget customWidget;
  const ImagePickerButton(this.imagePath, this.customWidget, {super.key});

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
                color: Colors.transparent,
                border: Border.all(color: MAIN_PINK, width: 3),
                shape: BoxShape.circle,
              ),
              child: Material(
                color: WHITE,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderOnForeground: true,
                child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => customWidget));
                    },
                    child: Image.asset(
                      imagePath,
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