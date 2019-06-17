import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'FormScreen.dart';

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("复杂的Widget学习"),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          Text("复杂的Widget学习-单选框、复选框、输入框、表单",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            ),
            ),
          SwitchAndCheckBoxTestRoute(),
          NormalTextField(),
          FocusTestRoute(),
        ],
      ),
      
    ),
    );
  }
}

class NormalTextField extends StatefulWidget {
  NormalTextField({Key key}) : super(key: key);

  _NormalTextFieldState createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {

TextEditingController _unameController=new TextEditingController();
TextEditingController _selectionController = new TextEditingController();

@override
void initState() { 
  //监听输入改变  
  _unameController.addListener((){
    print(_unameController.text);
  });
}

  @override
  Widget build(BuildContext context) {
    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
    baseOffset: 2,
    extentOffset: _selectionController.text.length
  );
    // Theme(data: Theme.of(context).copyWith(
    //   hintColor: Colors.grey[200], //定义下划线颜色
    //     inputDecorationTheme: InputDecorationTheme(
    //         labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
    //         hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
    //     )
    // ),);
    return Container(
       child: Column(
         children: <Widget>[
          TextField(autofocus: true,
            controller: _selectionController, //设置controller
            decoration: InputDecoration(
            hintText: "user name or email",
            labelText: "userName",
            prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _unameController,
            decoration: InputDecoration(
            hintText: "password",
            labelText: "password",
            prefixIcon: Icon(Icons.lock),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
            border: InputBorder.none //隐藏下划线
          ),
          onChanged: (v) {
            print(_unameController.text);
            print("onChange: $v");
          },
          obscureText: true,
          ),
         ],
       ),
       decoration: BoxDecoration(
         // 下滑线浅灰色，宽度1像素
         border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
       ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面  
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  FocusTestRoute({Key key}) : super(key: key);

  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  Widget build(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      hintColor: Colors.grey[200], //定义下划线颜色
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
      )
    ),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            focusNode: focusNode1,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "input1",
              hintText: "inpu1",
              //下面添加的红色下划线并不能起作用
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
              prefixIcon: Icon(Icons.people),
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2",
              hintText: "inpu2",
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                CupertinoButton(
                  child: Text("iOS样式的button--打开form"),
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FormScreen()
                      ));
                  },
                ),
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起  
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          }
          ),
        ],
      ),
    )
  );
  }
}