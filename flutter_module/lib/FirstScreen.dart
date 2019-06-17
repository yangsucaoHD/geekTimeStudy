import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SecondScreen.dart';
import 'SwitchScreen.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Scaffold(
      appBar: AppBar(title: Text('基础Widget学习')),
      body: Center(
        child:Column(
          children: <Widget>[
            //------------text--------------
            Text("hello world" * 4),
            Text("dhsjhdsfhskhfdskahdflashflaskhfdlashfdsafdsfsafsadfsadfsafdgfdhgjflkjflsahflajsf",
            textAlign: TextAlign.center,
            maxLines: 2,),
            Text("Bigger font",
            textScaleFactor: 0.8,),
            Text("font has style",
            style: TextStyle(color: Colors.blue,
            fontSize: 18.0,
            height: 3,
            fontFamily: "Courier",
            background: Paint()..color = Colors.yellow,
            )
            ),
            Text.rich(TextSpan(
              children:[
                TextSpan(text: "span:",
                style: TextStyle(
                  fontSize: 18
                )
                ),
                TextSpan(text: "String",
                style: TextStyle(color: Colors.blue),
                // recognizer: 
                ),
                ] 
              )
              ),
             //------------text--------------
             //------------button--------------
            RaisedButton(
            child: Text('查看商品查看页'),
            onPressed: (){//SystemNavigator.pop()
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SecondScreen()
                ));
            },
          ),
          FlatButton(onPressed: ()=>{},
          color: Colors.yellow,
          child: Text("扁平按钮"),
          ),
          OutlineButton(color: Colors.red,
          child: Text("OutlineButton--基础难点"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SwitchScreen()
                ));
           },),
          IconButton(icon: Icon(Icons.thumb_up),
          onPressed: ()=>{},),
          //------------button--------------
          //------------image--------------
          Image.asset("images/avatar.png",
          width: 100,),
          Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100,),
          Text(icons,
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 24.0,
            color: Colors.green),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible,color: Colors.green,),
                  Icon(Icons.error,color: Colors.green,),
                  Icon(Icons.fingerprint,color: Colors.green,),
  ],
            ),
          ],
        )
      ),
    );
  }
}