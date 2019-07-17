import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/setting_page.dart';
import 'page/news_page.dart';
import 'widget/tab_widget.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      HomePage(),
      NewsPage(),
      SettingPage()
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabWidget(pageList,navBackgroundColor: Colors.teal[100],),
    );
  }
}

