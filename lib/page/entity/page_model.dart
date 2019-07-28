import 'package:dio/dio.dart';
import '../../theme/api.dart';
import 'cata_icon_bean.dart';
import 'dart:convert';

Future<List<CataIconBean>> getCataIcons() async{
  try{
    Response<String> response = await Dio().get(API_CATA_ICONS);
    List jsonArray = json.decode(response.toString());
    List<CataIconBean> icons = jsonArray.map((item)=> new CataIconBean.fromJson(item)).toList();
    return Future.value(icons);
  }catch (e){
    print(e.toString());
    return Future.error(e.toString());
  }

}