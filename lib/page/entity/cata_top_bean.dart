
/// 顶部viewpager实体类
class CataTopBean {

  String title;
  String src;
  int id;
  int type;

  CataTopBean({this.title, this.src, this.id, this.type});


  factory CataTopBean.fromJson(Map<String,dynamic> jsonString){

    return CataTopBean(
      title: jsonString['title'],
      src: jsonString['src'],
      id: jsonString['id'],
      type: jsonString['type'],
    );
  }

}