import 'package:flutter/cupertino.dart';

final myLightThemeData = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: myColorGreen2.color,
);

final myDarkThemeData = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: myColorGreen2.darkColor,
);

const myColorPink1 = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 250, 199, 180),
  darkColor: Color.fromARGB(255, 248, 169, 147),
);

const myColorPink2 = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 248, 169, 147),
  darkColor: Color.fromARGB(255, 216, 129, 108),
);

const myColorPink3 = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 216, 129, 108),
  darkColor: Color.fromARGB(255, 250, 199, 180),
);

const myColorGreen1 = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 158, 208, 148),
  darkColor: Color.fromARGB(255, 60, 135, 137),
);

const myColorGreen2 = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 60, 135, 137),
  darkColor: Color.fromARGB(255, 158, 208, 148),
);
