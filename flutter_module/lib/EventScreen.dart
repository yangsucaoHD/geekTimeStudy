import 'package:flutter/material.dart';


class EventScreen extends StatelessWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("事件响应"),),
      body: Center(
        // child: GestureDetectorScreen(),
        // child: _Drag(),
        child: _DragVertical(),
        // child: _ScaleTestRoute(),
      ),
    );
  }
}

class GestureDetectorScreen extends StatefulWidget {
  GestureDetectorScreen({Key key}) : super(key: key);

  _GestureDetectorScreenState createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  String _opertion = "No Gesture detected!";
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(_opertion,
            style: TextStyle(color: Colors.white),),
          ),
          onTap: ()=>updateText("Tap"),
          onDoubleTap: ()=>updateText("DoubleTap"),
          onLongPress: ()=>updateText("onLongPress"),
        ),
      );
  }

  void updateText(String str) {
    setState(() {
      _opertion = str;
    });
  }

}




class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            }
          ),
        )
      ],
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  _ScaleTestRoute({Key key}) : super(key: key);

  __ScaleTestRouteState createState() => __ScaleTestRouteState();
}

class __ScaleTestRouteState extends State<_ScaleTestRoute> {
   double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
     child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("./images/avater.png", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width=200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
   );
  }
}
