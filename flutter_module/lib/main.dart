// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
//         // counter didn't reset back to zero; the application is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have clicked the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'FirstScreen.dart';

// void main() {
//   runApp(MaterialApp(
//     title: '导航栏',
//     home: FirstScreen(),
//   ));
// }

import 'dart:developer';
import 'dart:ui';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_module/FirstScreen.dart';
import 'package:flutter_module/ScrollScreen.dart';
import 'LayoutScreen.dart';
import 'ContainerScreen.dart';
import 'ScrollScreen.dart';
import 'SecondScreen.dart';
import 'FunctionScreen.dart';
import 'EventScreen.dart';
import 'AnimationScreen.dart';
import 'CustomScreen.dart';
import 'FileIOScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_module/I18nScreen.dart';
import 'package:flutter_module/i10n/localization_intl.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'simple_page_widgets.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///register page widget builders,the key is pageName
    // FlutterBoost.singleton.registerPageBuilders({
    //   'first': (pageName, params, _) => FirstRouteWidget(),
    //   'second': (pageName, params, _) => SecondRouteWidget(),
    //   'tab': (pageName, params, _) => TabRouteWidget(),
    //   'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),

    //   ///可以在native层通过 getContainerParams 来传递参数
    //   'flutterPage': (pageName, params, _) {
    //     print("flutterPage params:$params");

    //     return FlutterRouteWidget();
    //   },
    // });
    
    ///query current top page and load it
    // FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "newPage" : (context) => NewRoute(),
        "new_page":(context)=>EchoRoute(),
        "countWidget":(context)=>CounterWidget(),
        },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const DemoLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('zh', 'CN'),
      ],
      locale: const Locale('zh'),
      // builder: FlutterBoost.init(),///init container manager
      // builder: FlutterBoost.init(postPush: _onRoutePushed),
    );
  }

    void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
//    List<OverlayEntry> newEntries = route.overlayEntries
//        .map((OverlayEntry entry) => OverlayEntry(
//            builder: (BuildContext context) {
//              final pageWidget = entry.builder(context);
//              return Stack(
//                children: <Widget>[
//                  pageWidget,
//                  Positioned(
//                    child: Text(
//                      "pageName:$pageName\npageWidget:${pageWidget.toStringShort()}",
//                      style: TextStyle(fontSize: 12.0, color: Colors.red),
//                    ),
//                    left: 8.0,
//                    top: 8.0,
//                  )
//                ],
//              );
//            },
//            opaque: entry.opaque,
//            maintainState: entry.maintainState))
//        .toList(growable: true);
//
//    route.overlayEntries.clear();
//    route.overlayEntries.addAll(newEntries);
  }

}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const platform = const MethodChannel('samples.flutter.io/battery');

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


// Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('返回native页面'),
                  onPressed: (){
                    // FlutterBoost.singleton.openPage("MainViewController", {});
                    // FlutterBoost.singleton.closePageForContext(context);
                  },
                ),
                RaisedButton(
                  child: Text('Get Battery Level'),
                  onPressed: _getBatteryLevel,
                ),
              ],
            ),
            Text(_batteryLevel),
            RaisedButton(
              child: Text('基础Widget学习'),
              onPressed: (){//SystemNavigator.pop()
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => FirstScreen()
                  ));
              },
            ),
            RaisedButton(
              child: Text('布局Widget学习'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LayoutScreen()
                  ));
              },
            ),
            RaisedButton(
              child: Text('容器Widget学习'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ContainerFullScreen()//ContainerScreen()
                  ));
              },
            ),
            RaisedButton(
              child: Text("滚动视图"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ScrollScreen(),
                ));
              },
            ),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
              child: Text("功能widget"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>FunctionScreen(),
                ));
              },
            ),
                RaisedButton(
              child: Text("事件"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>EventScreen(),
                ));
              },
            ),
            RaisedButton(
              child: Text("动画"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>AnimationScreen(),
                ));
              },
            ),
             RaisedButton(
              child: Text("自定义"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>CustomScreen(),
                ));
              },
            ),
              ],
            ),
            RaisedButton(
              child: Text("文件与网络"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>FileIOScreen(),
                ));
              },
            ),
            RaisedButton(
              child: Text("国际化"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>I18nScreen(),
                ));
              },
            ),
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child:Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.pushNamed(context, "newPage");
                // Navigator.of(context).pushNamed("new_page", arguments: "hi");
                // Navigator.push(context, 
                // MaterialPageRoute(builder:(context) {
                //   return  NewRoute();
                // }));
                Navigator.of(context).pushNamed("countWidget");
                // FlutterBoost.singleton.openPage("second", {}, animated: true);
              },),
            FlatButton(
              child:Text("debugDumpRenderTree"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpRenderTree();
              },),
            RandomEnglishWord(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class NewRoute extends StatelessWidget {
  const NewRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
        ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //获取路由参数  
    var args=ModalRoute.of(context).settings.arguments;
    //...省略无关代码
  }
}

class RandomEnglishWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({
    Key key,
    this.initValue = 0});

  int initValue;
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() { 
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }



  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("$_counter"),
          onPressed: () {
            setState(() {
              ++_counter;
            });
          },
        ),
      ),
    );
  }

@override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

@override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}