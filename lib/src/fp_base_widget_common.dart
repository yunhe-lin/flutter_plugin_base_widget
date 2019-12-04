import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_base_widget/src/fp_theme_config.dart';

mixin FPBaseWidgetLifecycle<T extends StatefulWidget> on State<T>  {
  
  bool _showAppBar = true;

  double _appBarHeight;

  BuildContext get buildContext => context;
  bool get appBarHidden => !_showAppBar;
  
  String getClassName() {
    if (context == null) {
      return null;
    }
    String className = context?.toString();
    if (className == null) {
      return null;
    }
    className = className.substring(0, className.indexOf("("));
    return className;
  }


  Widget buildFP(BuildContext context, {bool useMaterApp = true}) {

    if (!useMaterApp) {
      return fpBody(context);
    }

    if (_showAppBar != null && _showAppBar == false) {
      return Scaffold(
        body: fpBody(context),
      );
    }
    return new Scaffold(
      appBar: _fpAppBar(context),
      body: fpBody(context),
    );
  }

  Widget _fpAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(_appBarHeight ?? fpAppBarHeight()),
      child: new Container(
        padding: EdgeInsets.only(top: 0),
        color: (FPThemeConifg.appBarColor) ?? Colors.white,
        child: fpAppBar(context)
      ),
    );
  }

  // override method

  double fpAppBarHeight() {
    return 50;
  }

  Widget fpAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: fpAppBarColor(),
      leading: fpLeading(context),
      title: fpTitle(context),
      elevation: 3.0,
      actions: fpActions(context),
    );
  }

  Widget customAppBar(BuildContext context) {
    return _fpAppBar(context);
  }

  Widget fpLeading(BuildContext context) {
    return null;
  }

  Widget fpTitle(BuildContext context) {
    return null;
  }

  List<Widget> fpActions(BuildContext context) {
    return [];
  }

  Color fpAppBarColor() {
    return FPThemeConifg.appBarColor ?? Colors.white;
  }

  Widget fpBody(BuildContext context) {
    return new Container();
  }

  // public set method
  void setAppBar({bool hidden}) {
    setState(() {
      _showAppBar = !hidden;
    });
  }

  void setAppBarHeight(double height) {
    assert(height > 0);
    setState(() {
      _appBarHeight = height;
    });
  }
}