import 'package:flutter/material.dart';
import '../entity/cata_top_bean.dart';
import '../entity/page_model.dart';

/// 顶部的banner推荐或者广告，自动播放的viewpager

class CataTopComponent extends StatefulWidget {

  @override
  _CataTopComponentState createState() => _CataTopComponentState();
}

class _CataTopComponentState extends State<CataTopComponent> {
  List<CataTopBean> data = List();


  _CataTopComponentState(){

    Duration duration =Duration(seconds: 5);


//    getTopIcons()
//        .then((icons){
//      setState(() {
//        this.data = icons;
//      });
//    })
//        .catchError((e){
//      print(e);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
