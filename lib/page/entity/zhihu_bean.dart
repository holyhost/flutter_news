
//// 消息实体类


class ZhihuBean {

  String date;
  List<StoryBean> stories;
  List<TopStoryBean> top_stories;

  ZhihuBean({this.date, this.stories, this.top_stories});


  factory ZhihuBean.fromJson(Map<String,dynamic> jsonString){
    var listStories = jsonString['stories'] as List;
    var listTopStories = jsonString['top_stories'] as List;


    return ZhihuBean(
      date: jsonString['date'],
      stories: listStories.map((i) => StoryBean.fromJson(i)).toList(),
      top_stories: listTopStories.map((i) => TopStoryBean.fromJson(i)).toList(),
    );
  }
}


class StoryBean{
  List<String> images;
  int type;
  int id;
  String ga_prefix;
  String title;

//// 构造器
  StoryBean({this.images,this.type, this.id, this.ga_prefix, this.title});


  ////将json字符串反序列化成对象
  factory StoryBean.fromJson(Map<String, dynamic> jsonString){
    // images: ["https://pic1.zhimg.com/v2-338fdd84db34667823ec6e22194abd38.jpg"],
    // images的格式如上所示：是一个string数组类型，dart里面没有数组类型，但是有List。
    var imagesStories = jsonString['images'];

    return StoryBean(
        images: List<String>.from(imagesStories),
        type: jsonString['type'],
        id: jsonString['id'],
        ga_prefix: jsonString['ga_prefix'],
        title: jsonString['title'],
    );
  }

}

class TopStoryBean{
  String image;
  int type;
  int id;
  String ga_prefix;
  String title;

//// 构造器
  TopStoryBean({this.image, this.type, this.id, this.ga_prefix, this.title});


  ////将json字符串反序列化成对象
  factory TopStoryBean.fromJson(Map<String, dynamic> jsonString){

    return TopStoryBean(
      image: jsonString['image'],
      type: jsonString['type'],
      id: jsonString['id'],
      ga_prefix: jsonString['ga_prefix'],
      title: jsonString['title'],
    );
  }

}