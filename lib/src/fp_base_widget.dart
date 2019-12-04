
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_plugin_base_widget/src/fp_base_widget_common.dart';
import 'package:flutter_plugin_base_widget/src/fp_base_widget_status.dart';

abstract class FPBaseWidget extends StatefulWidget with FPWidgetStateInstance{

  @override 
  FPBaseWidgetState createState() {
    FPBaseWidgetState baseWidget = getState();
    setWidgetState(baseWidget);
    return baseWidget;
  }
  FPBaseWidgetState getState();

  String getStateName() {
    return baseWidget.getClassName();
  }

  

}

abstract class FPWidgetStateInstance {

  FPBaseWidgetState get baseWidget => _baseWidget;
  FPBaseWidgetState _baseWidget;
  
  void setWidgetState(FPBaseWidgetState w) {
    _baseWidget = w;
  }
}


// 状态机 部分
// 生命周期部分
// loaddata 部分
abstract class FPBaseWidgetState<T extends FPBaseWidget> extends State<T> with WidgetsBindingObserver , FPBaseWidgetLifecycle, FPBaseWidgetStatus, AutomaticKeepAliveClientMixin {

  @override 
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => tuoWantKeepAlive;

  @protected
  bool get tuoWantKeepAlive => false;

  @override 
  Widget build(BuildContext context) {
    if (status == FPWidgetStatus.empty) {
      return _scaffold(fpEmptyWidget(context));
    }
    if (status == FPWidgetStatus.error) {
      return _scaffold(fpErrorWidget(context));
    } 
    if (status == FPWidgetStatus.loading) {
      return _scaffold(fpLoadingWidget(context));
    }
    return buildFP(context);
  }

  Widget _scaffold(Widget body) {
    if (appBarHidden) {
      return body;
    }
    return Scaffold(
      appBar: customAppBar(buildContext),
      body: body,
    );
  }

}