import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/main_app_bar.dart';

class ImagePickScreen extends StatefulWidget {
  const ImagePickScreen({super.key});

  @override
  State<ImagePickScreen> createState() => _ImagePickScreenState();
}

class _ImagePickScreenState extends State<ImagePickScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        COLOR_TRANSPARENT,
        WHITE,
        textTitle: Text(
          PICK_AN_IMAGE_ITALIAN,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
