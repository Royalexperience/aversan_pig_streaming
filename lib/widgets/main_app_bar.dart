import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color appBarBackgroundColor;
  final Color themeColor;
  final Text? textTitle;

  const MainAppBar(this.appBarBackgroundColor, this.themeColor, {super.key, this.textTitle});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
  
  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: widget.appBarBackgroundColor,
        title: widget.textTitle,
        elevation: 0,
        iconTheme: IconThemeData(
          color: widget.themeColor, //change your color here
        ),
    );
  }
}