// Flutter code sample for SingleChildScrollView
//
// In this example, the children are spaced out equally, unless there's no more
// room, in which case they stack vertically and scroll.
//
// When using this technique, [Expanded] and [Flexible] are not useful, because
// in both cases the "available space" is infinite (since this is in a viewport).
// The next section describes a technique for providing a maximum height constraint.

import 'package:flutter/material.dart';
import 'package:flutter_app1/custmoView/SingleLineFittedBox.dart';

/**
 * 适配原理
 *  FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
 * FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
 *FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。
 */
void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

///单行缩放布局
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  /**
   * 可以看到，当数字为' 90000000000000000 '时，三个数字的长度加起来已经超出了测试设备的屏幕宽度，
   * 所以直接使用 Row 会溢出，当给 Row 添加上如果加上 FittedBox时，就可以按比例缩放至一行显示，
   * 实现了我们预期的效果。但是当数字没有那么大时，比如下面的 ' 800 '，直接使用 Row 是可以的，
   * 但加上 FittedBox 后三个数字虽然也能正常显示，但是它们却挤在了一起，这不符合我们的期望。
   * 之所以会这样，原因其实很简单：在指定主轴对齐方式为 spaceEvenly 的情况下，
   * Row 在进行布局时会拿到父组件的约束，如果约束的 maxWidth 不是无限大，
   * 则 Row 会根据子组件的数量和它们的大小在主轴方向来根据 spaceEvenly 填充算法来分割水平方向的长度，
   * 最终Row 的宽度为 maxWidth；但如果 maxWidth 为无限大时，就无法在进行分割了，所以此时 Row 就会将子组件的宽度之和作为自己的宽度。

      回示例中，当 Row 没有被 FittedBox 包裹时，此时父组件传给 Row 的约束的 maxWidth 为屏幕宽度，此时，Row 的宽度也就是屏幕宽度，而当被FittedBox 包裹时，FittedBox 传给 Row 的约束的 maxWidth 为无限大（double.infinity），因此Row 的最终宽度就是子组件的宽度之和。

      问题原因找到了，那解决的思路就很简单了，我们只需要让FittedBox 子元素接收到的约束的 maxWidth 为屏幕宽度即可，为此我们封装了一个 SingleLineFittedBox 来替换 FittedBox 以达到我们预期的效果，实现如下：
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //这个超出屏幕宽度了
            wRow(' 900000000000000000000000000000000 '),
            //这个单行缩放了
            SingleLineFittedBox(child: wRow(' 900000000000000000000000000000000')),
            wRow(' 800 '),
            //这个单行缩放了，但MainAxisAlignment.spaceEvenly没起到作用。因为row的父布局是无限大。没有具体尺寸。见上面注释,
            SingleLineFittedBox(child: wRow(' 800 ')),
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  // 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}
