import 'package:flutter/material.dart';

enum ScreenType {
  SMALL,
  MEDIUM,
  LARGE,
}

class ScreenSizeConfig {
  BuildContext context;

  double screenWidth;
  double screenHeight;
  ScreenType screenType;

  ScreenSizeConfig(BuildContext context) {
    this.screenWidth = MediaQuery.of(context).size.width;
    this.screenHeight = MediaQuery.of(context).size.height;
    _setScreen();
  }

  void _setScreen() {
    if (this.screenWidth >= 320 && this.screenWidth < 375) {
      this.screenType = ScreenType.SMALL;
    }
    if (this.screenWidth >= 375 && this.screenWidth < 414) {
      this.screenType = ScreenType.MEDIUM;
    }
    if (this.screenWidth >= 414) {
      this.screenType = ScreenType.LARGE;
    }
  }
}

class FontSizeConfig {
  double titleFontSize;
  double descriptionFontSize;
  ScreenSizeConfig _screenSizeConfig;

  FontSizeConfig(ScreenSizeConfig screenSize) {
    this._screenSizeConfig = screenSize;
    _init();
  }

  void _init() {
    switch (this._screenSizeConfig.screenType) {
      case ScreenType.SMALL:
        this.titleFontSize = 16;
        this.descriptionFontSize = 14;
        break;
      case ScreenType.MEDIUM:
        this.titleFontSize = 24;
        this.descriptionFontSize = 20;
        break;
      case ScreenType.LARGE:
        this.titleFontSize = 28;
        this.descriptionFontSize = 20;
        break;
      default:
        this.titleFontSize = 28;
        this.descriptionFontSize = 20;
        break;
    }
  }
}
