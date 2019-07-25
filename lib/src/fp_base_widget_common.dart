import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin_base_widget/src/fp_theme_config.dart';

abstract class FPBaseWidgetLifecycle {
  State _baseState;
  BuildContext _buildContext;
  bool _showAppBar = true;

  double _appBarHeight;

  BuildContext get buildContext => _buildContext;

  String getClassName() {
    if (_buildContext == null) {
      return null;
    }
    String className = _buildContext.toString();
    if (className == null) {
      return null;
    }
    className = className.substring(0, className.indexOf("("));
    return className;
  }

  void initFPWdiget(BuildContext context, State state) {
    _baseState = state;
    _buildContext = context;
  }

  Widget buildFP(BuildContext context) {
    if (_showAppBar != null && _showAppBar == false) {
      return new Scaffold(
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
        color: (FPThemeConifg.appBarColor) ?? Colors.white,
        child: SafeArea(
          child: fpAppBar(context),
        ),
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
    _baseState.setState((){
      _showAppBar = !hidden;
    });
  }

  void setAppBarHeight(double height) {
    assert(height > 0);
    _baseState.setState((){
      _appBarHeight = height;
    });
  }
}