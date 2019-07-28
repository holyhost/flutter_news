import 'package:flutter/material.dart';
import '../widget/tab_widget.dart';
import '../page/home_page.dart';
import '../page/news_page.dart';
import '../page/setting_page.dart';
import '../page/news_page_detail.dart';


List<Widget> pageList = [
  HomePage(),
  NewsPage(),
  SettingPage()
];
//配置路由
 final routes = {
   '/':(context) => TabWidget(pageList,navBackgroundColor: Colors.teal[100],),

 };

 //获取参数
var onGenerateRoute = (RouteSettings settings){
  final routeName = settings.name;
  final Function pageContentBuilder = routes[routeName];
  if(pageContentBuilder != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context,arguments: settings.arguments)
      );
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context)=>pageContentBuilder(context)
      );
      return route;
    }
  }
};