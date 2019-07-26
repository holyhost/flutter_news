class ZhihuDetailBean{

  String body;//html标签内容
  String image_source;
  String title;
  String image;
  List<String> js;
  String ga_prefix;
  List<String> images;
  int type;
  int id;
  List<String> css;


  ZhihuDetailBean({this.body, this.image_source, this.title, this.image, this.js,
      this.ga_prefix, this.images, this.type, this.id,
      this.css}); ////将json字符串反序列化成对象
  factory ZhihuDetailBean.fromJson(Map<String, dynamic> jsonString){
    // images: ["https://pic1.zhimg.com/v2-338fdd84db34667823ec6e22194abd38.jpg"],
    // images的格式如上所示：是一个string数组类型，dart里面没有数组类型，但是有List。
    var imagesStories = jsonString['images'];

    return ZhihuDetailBean(
      images: List<String>.from(imagesStories),
      type: jsonString['type'],
      id: jsonString['id'],
      ga_prefix: jsonString['ga_prefix'],
      title: jsonString['title'],
      body: jsonString['body'],
      image_source: jsonString['image_source'],
      image: jsonString['image'],
//      type: jsonString['type'],
    );
  }

}