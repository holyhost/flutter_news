import 'package:flutter/material.dart';
import '../entity/cata_icon_bean.dart';
import '../entity/page_model.dart';

//每行最大的个数
final int rowCount = 10;
class CataTypeComponent extends StatefulWidget {
  @override
  _CataTypeComponentState createState() => _CataTypeComponentState();
}

class _CataTypeComponentState extends State<CataTypeComponent> {
  List<CataIconBean> data = List();


  _CataTypeComponentState(){
      getCataIcons()
          .then((icons){
        setState(() {
          this.data = icons;
        });
      })
          .catchError((e){
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    return Container(
//      child: (this.data ==null||this.data.length<1)?null:CataIconColum(columnBeans:this.data),
    padding: EdgeInsets.fromLTRB(20, 100, 20,0),
      child: (this.data ==null||this.data.length<1)?null:_buildGridView(this.data,controller),
    );
  }
  
  /// 返回一个pageView,data是所有的数据
  /// 10 是每页icon的最大数量。
  _buildGridView(List<CataIconBean> data,TabController controller){

    List<Widget> pages = List();
    for(int i=0;i<data.length;i++){
      if(i%10==0){
        List<CataIconItem> rows = List();
        for(int j=i;j<i+10;j++){
          rows.add(CataIconItem(bean: data[j],));
        }
        pages.add(
          GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 30,
            padding: EdgeInsets.all(5),
            crossAxisCount: 5,
            childAspectRatio: 5/8,
            children: rows,
          )
        );

      }

    }
    int length = this.data.length ~/10;
    if(this.data.length %10 >0) {
      length += 1;
    }
      return  DefaultTabController(
        length: length,
        child:  Column(
            children: <Widget>[
              Container(
                height: 180,
                child:
                TabBarView(
                  children: pages,
                ),
              ),
              TabPageSelector(controller: controller),
            ],
          ),
      );
    }
  }


///上图下文 的widget
class CataIconItem extends StatefulWidget {

  final CataIconBean bean;
  CataIconItem({this.bean});

  @override
  _CataIconItemState createState() => _CataIconItemState();
}

class _CataIconItemState extends State<CataIconItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          Image.network(
            widget.bean.src,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5.0,),
          Text(widget.bean.title,
            style: TextStyle(
              fontSize: 12.0
            ),
          ),
        ],
      ),
    );
  }
}


