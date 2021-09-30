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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("data"),
        ElevatedButton(
          onPressed: () async {
            bool? delete = await showDeleteConfirmDialog1(context);
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确认删除");
            }
          },
          child: Text("dialog弹窗"),
        ),
        ElevatedButton(
          onPressed: () async {
            await changeLanguage();
          },
          child: Text("SimpleDialog弹窗"),
        ),
        ElevatedButton(
          onPressed: () async {
            await showListDialog();
          },
          child: Text("原始Dialog弹窗"),
        ),
      ],
    );
  }

  /// 弹出对话框,注意：如果AlertDialog的内容过长，内容将会溢出，这在很多时候可能不是我们期望的，所以如果对话框内容过长时，可以用SingleChildScrollView将内容包裹起来
  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(null), // 关闭对话框
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  ///实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了
  ///IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件
  ///（如ListView、GridView 、 CustomScrollView等）,应该使用以下dialog
  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);

//        return UnconstrainedBox(
//          constrainedAxis: Axis.vertical,
//          child: ConstrainedBox(
//            constraints: BoxConstraints(maxWidth: 280,maxHeight: 200),
//            child: Material(
//              child: child,
//              type: MaterialType.card,
//            ),
//          ),
//        );

//        return ConstrainedBox(
//          constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
//          child: Material(
//            child: child,
//            type: MaterialType.card,
//          ),
//        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }
}
