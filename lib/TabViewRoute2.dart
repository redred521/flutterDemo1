import 'package:flutter/material.dart';

import 'custmoView/KeepAliveWrapper.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: TabViewRoute2(),
    );
  }
}

class TabViewRoute2 extends StatelessWidget {

  const TabViewRoute2({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  List tabs = ["新闻", "历史", "图片"];
  return DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView( //构建
        children: tabs.map((e) {
          return KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
}