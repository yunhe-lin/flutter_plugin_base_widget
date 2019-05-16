# flutter_plugin_base_widget

base widget for plugins for widgets

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

~~~

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_base_widget/flutter_plugin_base_widget.dart';

class PPDateForLessonPage extends FPBaseWidget {
@override
FPBaseWidgetState<FPBaseWidget> getState() {
return _PPDateForLessonPage();
}
}

class _PPDateForLessonPage extends FPBaseWidgetState<PPDateForLessonPage> {
TuoRefresher _refresher;

@override
void initState() {
super.initState();
_fetchData();
}

_fetchData() {
setStatus(FPWidgetStatus.loading);
Future.delayed(Duration(seconds: 2), () {
setStatus(FPWidgetStatus.normal);
});
}

@override
fpBody(BuildContext context) {
return _refresher.refreshWidget(ListView.builder(
itemCount: 10,
itemBuilder: (BuildContext context, int index) {
return new Container(
height: 50,
color: index % 2 == 0 ? Colors.red : Colors.green,
);
},
));
}

@override
AppBar fpAppBar(BuildContext context) {
return new AppBar(
backgroundColor: Colors.white,
elevation: 0,
leading: new GestureDetector(
onTap: () {
TuoRouter.sharedInstance().pop();
},
child: Image.asset('images/public_black_back_icon.png',
width: 30, height: 30)),
title: new Text('预约',
style: new TextStyle(
color: Color(0xff333333),
fontSize: 24,
fontWeight: FontWeight.bold)),
actions: <Widget>[
new Padding(
padding: new EdgeInsets.all(1),
child: new GestureDetector(
child: Image.asset('images/practice_service_icon.png'),
),
),
],
);
}
}


~~~
