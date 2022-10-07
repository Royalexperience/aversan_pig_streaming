import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:flutter/material.dart';
import '../constants/themes/dark_color_scheme.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(PICK_AN_IMAGE_ITALIAN, textAlign: TextAlign.center,),
        iconTheme: IconThemeData(
          color: WHITE, //change your color here
        ),
      ),
    );
  }
}