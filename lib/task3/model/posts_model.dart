class PostsModel {
  List<Post>? listData;

  PostsModel({this.listData});

  PostsModel.fromJson(List<dynamic> json) {
    listData = <Post>[];
    listData = json.map((k) => Post.fromJson(k)).toList();
    // json.forEach((key, value) {
    //   print(value.toString());
    //   listData!.add(Post.fromJson(value));
    // });
  }
}

class Post {
  int? id;
  String? title;
  String? content;

  Post({
    this.id,
    this.title,
    this.content,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
