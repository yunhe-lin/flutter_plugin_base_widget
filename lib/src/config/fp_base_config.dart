import 'package:flutter/material.dart';

class FPBaseWidgetConfig {

  static FPBaseWidgetConfig _config = FPBaseWidgetConfig._inner();
  static FPBaseWidgetConfig get instance => _config;

  FPBaseWidgetConfig._inner();

  MediaQueryData _mediaQueryData;

  EdgeInsets get safePadding => _mediaQueryData?.padding;

  void init(BuildContext context) {
    assert(context != null);
    // _mediaQueryData = MediaQuery.of(context);
  }

}