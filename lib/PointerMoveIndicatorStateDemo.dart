import 'package:flutter/material.dart';

void main() {
  runApp(PointerMoveIndicatorStateDemo());
}

class PointerMoveIndicatorStateDemo extends StatelessWidget {
  const PointerMoveIndicatorStateDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PointerMoveIndicatorStateDemo",
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
  State<ValueListenableRoute> createState() => _PointerMoveIndicatorState();
}

class _PointerMoveIndicatorState extends State<ValueListenableRoute> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    ///手指在蓝色矩形区域内移动即可看到当前指针偏移，当触发指针事件时，参数 PointerDownEvent、 PointerMoveEvent、 PointerUpEvent 都是PointerEvent的子类，PointerEvent类中包括当前指针的一些信息，注意 Pointer，即“指针”， 指事件的触发者，可以是鼠标、触摸板、手指。
    //
    //如：
    //
    //position：它是指针相对于当对于全局坐标的偏移。
    //localPosition: 它是指针相对于当对于全局坐标的偏移
    //delta：两次指针移动事件（PointerMoveEvent）的距离。
    //pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
    //orientation：指针移动方向，是一个角度值。
    //上面只是PointerEvent一些常用属性，除了这些它还有很多属性，读者可以查看API文档。
    //
    //还有一个behavior属性，它决定子组件如何响应命中测试，关于该属性我们将在后面 “事件处理流程” 一节中详细介绍。
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}


///忽略指针事件
///Listener(
//  child: AbsorbPointer(
//    child: Listener(
//      child: Container(
//        color: Colors.red,
//        width: 200.0,
//        height: 100.0,
//      ),
//      onPointerDown: (event)=>print("in"),
//    ),
//  ),
//  onPointerDown: (event)=>print("up"),
//)

///点击Container时，由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出"in"，但AbsorbPointer本身是可以接收指针事件的，所以会输出"up"。如果将AbsorbPointer换成IgnorePointer，那么两个都不会输出。