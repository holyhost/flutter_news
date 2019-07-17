import 'package:dio/dio.dart';
import '../../theme/api.dart';
import './zhihu_bean.dart';
import 'dart:convert';
class ZhihuModel{


}


Future<ZhihuBean> getHttp() async {
  try {
    Response<String> response = await Dio().get(API_ZHIHU_LATEST);
    print(response.toString());
    ZhihuBean bean = ZhihuBean.fromJson(json.decode(response.toString()));
    return Future.value(bean);
  } catch (e) {
    print(e);
  }
  return null;
}