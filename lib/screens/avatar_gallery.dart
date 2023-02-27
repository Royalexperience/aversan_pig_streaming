import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/models/user_avatar.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/main_app_bar.dart';

class AvatarGallery extends StatefulWidget {
  final List<UserAvatar> avatarInfoList;
  final int crossAxisCount;
  const AvatarGallery({super.key, required this.avatarInfoList, this.crossAxisCount = 2});

  @override
  State<AvatarGallery> createState() => _AvatarGalleryState();
}

class _AvatarGalleryState extends State<AvatarGallery> {
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
            crossAxisCount: widget.crossAxisCount,
            children: List.generate(
                widget.avatarInfoList.length,
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
                          Image.asset(widget.avatarInfoList[index].getAvatarImagePath, width: screenWidthPercentage(context, percentage: 0.30), height: screenHeightPercentage(context, percentage: 0.10),),
                          SizedBox(height: screenHeightPercentage(context, percentage: 0.00005)),
                          Text(widget.avatarInfoList[index].getAvatarName, style: TextStyle(color: WHITE,),)
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
