import 'package:flutter/material.dart';
import './entity/zhihu_model.dart';
import './entity/zhihu_bean.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../theme/api.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ZhihuBean zhihuData;

  _NewsPageState(){
    getHttp().then((value){
      print("-------------");
      print(value.stories.first.images.first);
      setState(() {
        this.zhihuData = value;

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("知乎日报"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: _getListItems(),
        ),
      ),
    );


  }

  List<Widget> _getListItems(){
    List<Widget> items = List();
    if(this.zhihuData == null ) return items;
    items.add(SizedBox(height: 10,));
    for(var bean in this.zhihuData.top_stories){
      items.add(_getListTile(title: bean.title,coverUrl: bean.image,id: bean.id));
      items.add(Divider(color: Colors.teal,));
    }

    for(var bean in this.zhihuData.stories){
      items.add(_getListTile(title: bean.title,coverUrl: bean.images.first,id: bean.id));
      items.add(Divider(color: Colors.teal,));
    }
    items.removeLast();
    return items;
  }

  ListTile _getListTile({String title,String coverUrl,int id}){
    return ListTile(
      leading: Image.network(coverUrl),
      title: Text(title),
      contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> WebView(

               initialUrl: API_ZHIHU_BODY+ "${id}",
              ))
          );
      },
    );
  }
}
