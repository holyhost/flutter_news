import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {

  // 页面
  List<Widget> pageList;
  // 标题，可以为空。默认为控字符串
  List<String> titleList = List();
  // 图标 可以为空。默认为home
  List<Icon> iconList = List();
  Color navBackgroundColor;
  TabWidget(this.pageList,{List<String> titles,List<Icons> icons,this.navBackgroundColor}){
    if(titles == null || titles.length<1){
      for(int i=0;i<pageList.length;i++){
        // 由于BottomNavigationBarItem必须要设置一个标题。默认给一个空字符串
        titleList.add("");
      }
    }
    if(icons == null || icons.length<1){
      for(int i=0;i<pageList.length;i++){
        // 添加默认图标-add default icon
        iconList.add(Icon(Icons.home));
      }
    }
    if(pageList == null || pageList.length<1){
      // 内容界面为空，抛出 异常
      throw FormatException('one page at least!');
    }

    if(pageList == null || pageList.length<1 || pageList.length!=titleList.length || pageList.length!=iconList.length){
      // 内容界面数量、标题数量、图标数量不一致，抛出异常。
      throw FormatException('data list is null or not equal!');
    }
  }

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {

  // 保存当前选中的位置
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: widget.pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // 条目
          items: this._getNavItems(),
          // 设置当前选中位置
          currentIndex: this._currentIndex,
          // 点击事件->设置当前选中位置,重新刷新界面
          onTap: (index){
              setState(() {
                this._currentIndex = index;
              });
          },
          // 设置BottomNavigationBar背景颜色，默认设置为白色
          backgroundColor: widget.navBackgroundColor == null ? Colors.white: widget.navBackgroundColor,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getNavItems(){
    List<BottomNavigationBarItem> items = List();
    for(int i=0;i < widget.titleList.length;i++){
      items.add(BottomNavigationBarItem(
        icon: widget.iconList[i],
        title:Text( widget.titleList[i]),
      )
      );
    }

    return items;
  }
}
