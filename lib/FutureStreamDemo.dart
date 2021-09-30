import 'package:flutter/material.dart';

void main() {
  runApp(FutureStreamDmeo());
}

class FutureStreamDmeo extends StatelessWidget {
  const FutureStreamDmeo({Key? key}) : super(key: key);

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
    return StreamBuilder<int>(
      stream: counter(), //
      //initialData: ,// a Stream<int> or null
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('没有Stream'),
            );
          case ConnectionState.waiting:
            return Center(
              child: Text('等待数据...'),
            );
          case ConnectionState.active:
            return Center(
              child: Text('active: ${snapshot.data}'),
            );
          case ConnectionState.done:
            return Center(
              child: Text('Stream 已关闭'),
            );
//          default:
//            return null;
        }

        ///return Text('Stream ${snapshot.data}'); // unreachable
      },
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
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
