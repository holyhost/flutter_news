import 'package:flutter/material.dart';
import './entity/zhihu_model.dart';
import './entity/zhihu_detail_bean.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsPageDetail extends StatefulWidget {
  final int articalId;

  NewsPageDetail(this.articalId);

  @override
  _NewsPageDetailState createState() => _NewsPageDetailState(this.articalId);
}

class _NewsPageDetailState extends State<NewsPageDetail> {
  ZhihuDetailBean zhihuDataDetail;
  final int articalId;
  _NewsPageDetailState(this.articalId){
    getZhihuDetail(articalId).then((value){

      print(value.title);
      setState(() {
        this.zhihuDataDetail = value;

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情"),
        ),
        body: Container(
          child: Html(data: zhihuDataDetail.body),
        )
      ),
    );


  }

}
