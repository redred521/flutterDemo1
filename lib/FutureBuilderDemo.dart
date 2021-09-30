import 'package:flutter/material.dart';

void main() {
  runApp(FutureBuilderDmeo());
}

class FutureBuilderDmeo extends StatelessWidget {
  const FutureBuilderDmeo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FutureBuilder",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: ValueListenableRoute(),
        ));
  }
}

class ValueListenableRoute extends StatefulWidget {
  const ValueListenableRoute({Key? key}) : super(key: key);

  @override
  State<ValueListenableRoute> createState() => _ValueListenableState();
}

class _ValueListenableState extends State<ValueListenableRoute> {
  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('ValueListenableBuilder 测试')),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}


//enum ConnectionState {
//  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
//  none,
//
//  /// 异步任务处于等待状态
//  waiting,
//
//  /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
//  active,
//
//  /// 异步任务已经终止.
//  done,
//}