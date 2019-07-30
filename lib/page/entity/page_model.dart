import 'package:dio/dio.dart';
import '../../theme/api.dart';
import 'cata_icon_bean.dart';
import 'cata_top_bean.dart';
import 'dart:convert';

Future<List<CataIconBean>> getCataIcons() async{
  try{
    Response<String> response = await Dio().get(API_CATA_ICONS);
    List jsonArray = json.decode(response.toString());
    List<CataIconBean> icons = jsonArray.map((item)=> new CataIconBean.fromJson(item)).toList();
    for(int i = 0;i<icons.length;i++){
      icons[i].src = API_HOST+icons[i].src;
    }
    return Future.value(icons);
  }catch (e){
    print(e.toString());
    return Future.error(e.toString());
  }

}

Future<List<CataTopBean>> getTopIcons() async{
  try{
    Response<String> response = await Dio().get(API_CATA_ICONS);
    List jsonArray = json.decode(response.toString());
    List<CataTopBean> icons = jsonArray.map((item)=> new CataTopBean.fromJson(item)).toList();
    for(int i = 0;i<icons.length;i++){
      icons[i].src = API_HOST+icons[i].src;
    }
    return Future.value(icons);
  }catch (e){
    print(e.toString());
    return Future.error(e.toString());
  }

}