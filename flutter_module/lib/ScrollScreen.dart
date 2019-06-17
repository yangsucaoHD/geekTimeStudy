import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("滚动视图"),),
        // body: SingleChildScrollViewTestRoute(),
        // body: ListViewScrollView(),
        // body: SeperatedListView(),
        // body: InfiniteListView(),
        // body: GridViewScrollView(),
        // body: InfiniteGridView(),
        body: CustomScrollViewTestRoute(),
      ),
    );
  }
}


class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column( 
            //动态创建一个List<Widget>  
            children: str.split("") 
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,)) 
                .toList(),
          ),
        ),
      ),
    );
  }
}


class ListViewScrollView extends StatelessWidget {
  const ListViewScrollView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index){
          return ListTile(title: Text("$index"),);
        },
      ),
    );
  }
}


class SeperatedListView extends StatelessWidget {
  const SeperatedListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.red,);
    Widget divider2 = Divider(color: Colors.blue,);
    return ListView.separated(
      itemCount: 50,
      itemBuilder: (BuildContext contex, int index){
        return ListTile(title: Text("$index"),);
      },      
      separatorBuilder: (BuildContext context, int index){
        return index%2==0 ? divider1 : divider2;
      },
    );
  }
}


class InfiniteListView extends StatefulWidget {
  InfiniteListView({Key key}) : super(key: key);

  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {

  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表"),),
          // SizedBox(
          Expanded(
            //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56 
            // height: MediaQuery.of(context).size.height-24-56-56,
            child: ListView.separated(
            itemCount: _words.length,
            itemBuilder: (context, index){
                      //如果到了表尾
              if (_words[index] == loadingTag) {
                //不足100条，继续获取数据
                if (_words.length - 1 < 100) {
                  //获取数据
                  _retrieveData();
                  //加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0)
                    ),
                  );
                } else {
                  //已经加载了100条数据，不再获取数据。
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
                  );
                }
              }
              //显示单词列表项
              return ListTile(title: Text("$index"),);
            },
            separatorBuilder: (BuildContext context, int index)=>Divider(height: 0,),
          ),
          ),
              ],
      ),
    );
  }


void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }
}




//固定横轴数量布局的GridView
class GridViewScrollView extends StatelessWidget {
  const GridViewScrollView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          crossAxisCount: 5,
          childAspectRatio: 0.5//宽高比
        ),
        children: <Widget>[
          Container(
            child: Icon(Icons.ac_unit),
            color: Colors.blue,
          ),
          Container(
            child: Icon(Icons.ac_unit),
            color: Colors.red,
          ),
          Container(
            child: Icon(Icons.airport_shuttle),
            color: Colors.blue,
          ),
          Container(
            child: Icon(Icons.beach_access),
            color: Colors.red,
          ),
          Container(
            child: Icon(Icons.ac_unit),
            color: Colors.blue,
          ),
          Container(
            child: Icon(Icons.ac_unit),
            color: Colors.red,
          ),
          Container(
            child: Icon(Icons.airport_shuttle),
            color: Colors.blue,
          ),
          Container(
            child: Icon(Icons.beach_access),
            color: Colors.red,
          ),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}




class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据  
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png", fit: BoxFit.cover,),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}