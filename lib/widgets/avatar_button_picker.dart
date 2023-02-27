import 'package:aversan_pig_streaming/models/user_avatar.dart';
import 'package:aversan_pig_streaming/screens/avatar_gallery.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../constants/themes/helping_functions.dart';

class AvatarButtonPicker extends StatefulWidget {
  final List<UserAvatar> avatarInfoList;
  const AvatarButtonPicker({super.key, required this.avatarInfoList});
  
  @override
  State<StatefulWidget> createState() => _AvatarPickerButtoState();
}

class _AvatarPickerButtoState extends State<AvatarButtonPicker> {
  // Rappresenta il percorso dell'avatar che verrà selezionato nell'avatar gallery
  // Si usa "late" per specificare che il suo valore è non nullo e verrà inizializzato in seguito
  late String _selectedAvatar;

  @override
  void initState() {
    super.initState();
    // Ogni volta che il widget viene ricostruito imposta come immagine del bottone quella di default
    _selectedAvatar = widget.avatarInfoList.first.getAvatarImagePath;
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
                      var indexImage = await Navigator.push(context, MaterialPageRoute(builder: (context) => AvatarGallery(avatarInfoList: widget.avatarInfoList)));
                      setState(() {
                        _selectedAvatar = widget.avatarInfoList[indexImage].getAvatarImagePath;
                      });
                    },
                    child: Image.asset(
                      _selectedAvatar,
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