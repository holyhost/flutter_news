import 'package:flutter/material.dart';
import '../entity/cata_icon_bean.dart';
import '../entity/page_model.dart';

class CataTypeComponent extends StatefulWidget {
  @override
  _CataTypeComponentState createState() => _CataTypeComponentState();
}

class _CataTypeComponentState extends State<CataTypeComponent> {
  List<CataIconBean> data = List();


  _CataTypeComponentState(){
      getCataIcons()
          .then((icons){
        print(icons.toString());
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
    return Container(
//      child: (this.data ==null||this.data.length<1)?null:CataIconColum(columnBeans:this.data),
    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: (this.data ==null||this.data.length<1)?null:_buildGridView(this.data),
    );
  }
  
  
  _buildGridView(List<CataIconBean> data){

    List<CataIconItem> rows = List();
    for(int i=0;i<data.length;i++){
      if(i%10==0){
        List<CataIconItem> rows = List();
        for(int j=i;j<i+10;j++){

        }
      }
      rows.add(CataIconItem(bean: data[i],));
    }

   return  PageView(
      children: <Widget>[
    GridView.count(

    mainAxisSpacing: 10,
      crossAxisSpacing: 30,
      padding: EdgeInsets.all(5),
      crossAxisCount: 5,
      childAspectRatio: 5/8,
      children: rows,

    ),
    GridView.count(

    mainAxisSpacing: 10,
    crossAxisSpacing: 30,
    padding: EdgeInsets.all(5),
    crossAxisCount: 5,
    childAspectRatio: 5/8,
    children: rows,

    )
      ],
    );
  }
}


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


