import 'package:flutter/material.dart';
import 'StackLayout.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("layout widget test"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            RowOrColumLayout(),
            SpecialColumLayout(),
            FlexLayout(),
            WrapLayout(),
            FlowLayout(),
            RaisedButton(
              child: Text("层叠Stack和Positioned定位布局"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> StackLayout()
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class RowOrColumLayout extends StatelessWidget {
  const RowOrColumLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,  
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                Text(" I am Jack "),
              ],
            ),
          ],
        ),
    );
  }
}

class SpecialColumLayout extends StatelessWidget {
  const SpecialColumLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  color: Colors.green,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度  
            children: <Widget>[
              Text("hello world "),
              Text("I am Jack "),
            ],
          ),
        )
      ],
    ),
  ),
);
  }
}


class FlexLayout extends StatelessWidget {
  const FlexLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间  
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



class WrapLayout extends StatelessWidget {
  const WrapLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("A"),
          ),
          label: Text("data1"),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("B"),
          ),
          label: Text("datadatadatat2"),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("C"),
          ),
          label: Text("data3"),
        ),
        Chip(
          label: Text("data4"),
        ),
        Chip(
          label: Text("data5"),
        ),
      ],
    );
  }
}



class FlowLayout extends StatelessWidget {
  const FlowLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(
        margin: EdgeInsets.all(10),
      ),
      children: <Widget>[
        Container(width: 20, height: 20, color: Colors.red,),
        Container(width: 20, height: 20, color: Colors.blue,),
        Container(width: 20, height: 20, color: Colors.yellow,),
        Container(width: 20, height: 20, color: Colors.orange,),
        Container(width: 20, height: 20, color: Colors.purple,),
        Container(width: 20, height: 20, color: Colors.green,)
      ],
    );
  }
}


class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,40.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}


