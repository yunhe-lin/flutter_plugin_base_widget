
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_base_widget/src/fp_theme_config.dart';

enum FPWidgetStatus {
  normal,
  loading,
  error,
  empty
}

abstract class FPBaseWidgetStatus {

  State _fpState;

  FPWidgetStatus _status = FPWidgetStatus.normal;

  get status => _status;
  void initStatus(State state, BuildContext context) {
    _fpState = state;
  }

  // public method

  setStatus(FPWidgetStatus fpstatus) {
    _fpState.setState((){
      _status = fpstatus;
    });
  }

  // override method

  Widget fpEmptyWidget(BuildContext context) {
    if (FPThemeConifg.emptyConifg != null) {
      return FPThemeConifg.emptyConifg(context);
    }
    return new Container(
      color: Colors.green,
    );
  }

  Widget fpErrorWidget(BuildContext context) {
    if (FPThemeConifg.errorConifg != null) {
      return FPThemeConifg.errorConifg(context);
    }
    return new Container(
      color: Colors.red,
    );
  }

  Widget fpLoadingWidget(BuildContext context) {
    if (FPThemeConifg.loadingConifg!= null) {
      return FPThemeConifg.loadingConifg(context);
    }
    return new Container(
      child: new Center(
              child: new CupertinoActivityIndicator(),
            )
    );
  }
}
