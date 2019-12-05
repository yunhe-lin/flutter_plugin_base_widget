import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_base_widget/src/fp_theme_config.dart';

enum FPWidgetStatus { normal, loading, error, empty }

mixin FPBaseWidgetStatus <T extends StatefulWidget> on State<T> {

  FPWidgetStatus _status = FPWidgetStatus.normal;

  get status => _status;

  @protected
  bool get useMaterial => true;

  // public method
  setStatus(FPWidgetStatus fpstatus, {VoidCallback callback}) {
    setState(() {
      _status = fpstatus;
      if (callback != null) {
        callback();
      }
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // override method
  Widget fpEmptyWidget(BuildContext context) {
    if (FPThemeConifg.emptyConifg != null) {
      return FPThemeConifg.emptyConifg(context);
    }
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            setEmptyImage() != null
                ? setEmptyImage()
                : new Image.asset(
                    'images/default_empty_icon.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
            new Text(
              setEmptyDes() != null ? setEmptyDes() : '诶？当前页面没有内容哦',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Color(0xff646464),
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  //子类复写此方法
  Image setEmptyImage() {
    return FPThemeConifg.emptyImage;
  }

  //子类复写此方法
  String setEmptyDes() {
    return FPThemeConifg.emptyText;
  }

  Widget fpErrorWidget(BuildContext context) {
    if (FPThemeConifg.errorConifg != null) {
      return FPThemeConifg.errorConifg(context);
    }
    return new Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            setErrorImage() != null
                ? setErrorImage()
                : new Image.asset(
                    'images/default_error_icon.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
            new Text(
              setErrorDes() != null ? setErrorDes() : '啊哦，网络出现了一些问题',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Color(0xff646464),
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            new SizedBox(
              height: 15,
            ),
            new GestureDetector(
              onTap: reloadCallback,
              child: new Container(
                height: 30,
                width: 100,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(15)),
                  border: new Border.all(color: Color(0xff969696), width: 1),
                ),
                child: Center(
                  child: new Text(
                    setReloadDes() ?? '重新加载',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Color(0xff969696),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //子类复写此方法
  Image setErrorImage() {
    return FPThemeConifg.errorImage;
  }

  //子类复写此方法
  String setErrorDes() {
    return FPThemeConifg.emptyText;
  }

  String setReloadDes() {
    return FPThemeConifg.reloadText;
  }

  //子类复写此方法
  void reloadCallback() {}

  Widget fpLoadingWidget(BuildContext context) {
    if (FPThemeConifg.loadingConifg != null) {
      return FPThemeConifg.loadingConifg(context);
    }
    return new Container(
        child: new Center(
      child: new CupertinoActivityIndicator(),
    ));
  }
}
