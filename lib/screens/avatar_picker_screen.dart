import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/utils/utils.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/main_app_bar.dart';

class AvatarPickerScreen extends StatefulWidget {
  const AvatarPickerScreen({super.key});

  @override
  State<AvatarPickerScreen> createState() => _AvatarPickerScreenState();
}

class _AvatarPickerScreenState extends State<AvatarPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        DARK_BACKGROUND_COLOR_FULL,
        WHITE,
        textTitle: Text(
          PICK_AN_IMAGE_ITALIAN,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
          child: Container(
          alignment: Alignment.center,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
                Utils.getUserAvatarList().length,
                (index) {
                  return Container(
                    margin: EdgeInsets.all(screenWidthPercentage(context, percentage: 0.08)),
                    child: InkWell(
                      splashColor: MAIN_PINK,
                      onTap: () {
                        Navigator.pop(context, index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(screenWidthPercentage(context, percentage: 0.001)),
                        child: Column(children: [
                          Image.asset(Utils.getUserAvatarList()[index].avatarImagePath, width: screenWidthPercentage(context, percentage: 0.30), height: screenHeightPercentage(context, percentage: 0.10),),
                          SizedBox(height: screenHeightPercentage(context, percentage: 0.00005)),
                          Text(Utils.getUserAvatarList()[index].avatarName, style: TextStyle(color: WHITE,),)
                        ]),
                      ),
                    ),
                  );
                }
              ),
            ),
        )
      ),
    );
  }
}
