class CataIconBean {

  String title;
  String src;
  int id;

  CataIconBean({this.title, this.src, this.id});


  factory CataIconBean.fromJson(Map<String,dynamic> jsonString){

    return CataIconBean(
      title: jsonString['title'],
      src: jsonString['src'],
      id: jsonString['id'],
    );
  }

}