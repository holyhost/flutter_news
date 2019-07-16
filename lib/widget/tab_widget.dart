import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {

  List<Widget> pageList;
  List<String> titleList = List();
  List<Icon> iconList = List();
  Color navBackgroundColor;
  TabWidget(this.pageList,{List<String> titles,List<Icons> icons,this.navBackgroundColor}){
    if(titles == null || titles.length<1){
      for(int i=0;i<pageList.length;i++){
        titleList.add("");
      }
    }
    if(icons == null || icons.length<1){
      for(int i=0;i<pageList.length;i++){
        iconList.add(Icon(Icons.home));
      }
    }
    if(pageList == null || pageList.length<1){
      throw FormatException('one page at least!');
    }

    if(pageList == null || pageList.length<1 || pageList.length!=titleList.length || pageList.length!=iconList.length){
      throw FormatException('data list is null or not equal!');
    }
  }

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: widget.pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: this._getNavItems(),
          currentIndex: this._currentIndex,
          onTap: (index){
              setState(() {
                this._currentIndex = index;
              });
          },
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
