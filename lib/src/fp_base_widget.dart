
import 'package:flutter/material.dart';
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
abstract class FPBaseWidgetState<T extends FPBaseWidget> extends State<T> with WidgetsBindingObserver , FPBaseWidgetLifecycle, FPBaseWidgetStatus {

  @override 
  void initState() {
    widget;
    initFPWdiget(context, this);
    initStatus(this, context);
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    if (status == FPWidgetStatus.empty) {
      return Scaffold(
        appBar: fpAppBar(context),
        body: fpEmptyWidget(context),
      );
    }
    if (status == FPWidgetStatus.error) {
      return Scaffold(
        appBar: fpAppBar(context),
        body: fpErrorWidget(context),
      );
    } 
    if (status == FPWidgetStatus.loading) {
      return Scaffold(
        appBar: fpAppBar(context),
        body: fpLoadingWidget(context),
      );
    }
    return buildFP(context);
  }

}