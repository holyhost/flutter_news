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
      child: (this.data ==null||this.data.length<1)?null:CataIconColum(columnBeans:this.data),
    );
  }
}

class CataIconColum extends StatefulWidget {

  final List<CataIconBean> columnBeans;

  CataIconColum({this.columnBeans});

  @override
  _CataColumState createState() => _CataColumState();
}

class _CataColumState extends State<CataIconColum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _buildColum(),
      ),
    );
  }

  List<CataIconRow>_buildColum(){
    List<CataIconRow> rows = List();
    for(int i=0;i<widget.columnBeans.length;i++){
      if(i%5 == 0){
        List<CataIconBean> rowBeans = List();
        for(int j=0+i;j<5+i;j++){
          rowBeans.add(widget.columnBeans[j]);
        }
        rows.add(CataIconRow(rowBeans: rowBeans,));
      }
    }
    return rows;
  }
}


class CataIconRow extends StatefulWidget {
  List<CataIconBean> rowBeans;


  CataIconRow({this.rowBeans});

  @override
  _CataIconRowState createState() => _CataIconRowState();
}

class _CataIconRowState extends State<CataIconRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: _buildRowWidgets(),
      ),
    );
  }

  List<Widget> _buildRowWidgets(){
    List<Widget> rows = List();
    for(int i =0;i<widget.rowBeans.length;i++){
      rows.add(CataIconItem(bean: widget.rowBeans[i],));
    }
    return rows;
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
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child:Column(
        children: <Widget>[
          Image.network(
            widget.bean.src,
            fit: BoxFit.cover,
          ),
          Text(widget.bean.title),
        ],
      ),
    );
  }
}


