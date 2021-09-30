import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        //路由表
        "new_page": (context) => NewRoute(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "TipRoute": (context) => TipRoute(
            text: ModalRoute.of(context)!.settings.arguments.toString()),
        //假设我们也想将上面路由传参示例中的TipRoute路由页注册到路由表中，以便也可以通过路由名来打开它。但是，由于TipRoute接受一个text 参数，我们如何在不改变TipRoute源码的前提下适配这种情况？其实很简单：
      },

      ///MaterialApp有一个onGenerateRoute属性，它在打开命名路由时可能会被调用，之所以说可能，
      ///是因为当调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，
      ///则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由。
      ///onGenerateRoute回调签名如下：
      onGenerateRoute: (RouteSettings settings) {
        print("通过onGenerateRoute()${settings.name}");
        print("通过onGenerateRoute()${settings.arguments}");
        if (settings.name == "Route3") {
          return MaterialPageRoute(
            builder: (context) {
              return Route3(
                text: settings.arguments.toString(),
              );
            },
          );
        }

      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = "默认标题"}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var resultStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //方式一，  导航到新路由
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));

                //方式二，  通过路由表跳转
                //Navigator.pushNamed(context, "new_page");
                //带参数
                Navigator.pushNamed(context, "new_page", arguments: "hi就是参数");
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
              },
            ),
            RaisedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
//                var result = await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return TipRoute(
//                        // 路由参数
//                        text: "我是提示xxxx",
//                      );
//                    },
//                  ),
//                );

                var result = await //方式二，  通过路由表跳转
                    //Navigator.pushNamed(context, "new_page");
                    //带参数
                    Navigator.pushNamed(context, "TipRoute",
                        arguments: "我是参数 hi");
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
                //输出`TipRoute`路由返回结果
                if (result != null) {
                  setState(() {
                    resultStr = result;
                  });
                } else {
                  resultStr = null;
                }
                print("路由返回值: $result");
              },
              child:
                  resultStr == null ? Text("打开提示页") : Text("路由返回值: $resultStr"),
            ),
            RaisedButton(
              onPressed: () async {
//                 打开`TipRoute`，并等待返回结果
//                var result = await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return Route3(
//                        // 路由参数
//                        text: "我是Route3提示xxxx",
//                      );
//                    },
//                  ),
//                );

                var result = await //方式二，  通过路由表跳转
//                    //Navigator.pushNamed(context, "new_page");
//                    //带参数
                    Navigator.pushNamed(context, "Route3",
                        arguments: "我是参数 Route3 hi");
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
                //输出`TipRoute`路由返回结果
                if (result != null) {
                  setState(() {
                    resultStr = result;
                  });
                } else {
                  resultStr = null;
                }
                print("路由返回值: $result");
              },
              child: resultStr == null
                  ? Text("打开Route3提示页")
                  : Text("路由返回值: $resultStr"),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//route1
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //命名路由参数传递，获取
    var args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route!recivieParas:${args}"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

//route2
class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text,
  }) : super(key: key); // 接收一个text参数

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//route3
class Route3 extends StatelessWidget {
  Route3({
    Key? key,
    required this.text,
  }) : super(key: key); // 接收一个text参数

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("route3"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是route3返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
