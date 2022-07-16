import 'package:flutter/material.dart';

typedef onTapLeading<T> = Function();

class CommonAppBar extends AppBar {
  CommonAppBar.commonAppBar({
    String? title,
    Widget? leading,
    onTapLeading? ontapleading,
    Color? appBarColor,
  }) : super(
            elevation: 0,
            leading: IconButton(
                onPressed: ontapleading,
                icon: leading ??
                    const Icon(Icons.arrow_back, color: Colors.black)),
            title: Text(
              title ?? "",
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: appBarColor ?? Colors.white);
}
