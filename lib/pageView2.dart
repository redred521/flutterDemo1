// Flutter code sample for PageView
//
// Here is an example of [PageView]. It creates a centered [Text] in each of the three pages
// which scroll horizontally.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp2());

/// This is the main application widget.
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  ///设置pageview缓存
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(Page(text: '$i'));
    }

//    final PageController controller =
//        PageController(initialPage: 1, keepPage: true, viewportFraction: 1);
    return PageView(
      children: children,
      allowImplicitScrolling: true,//设置pageview缓存.缓存前后一页
    );
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}
