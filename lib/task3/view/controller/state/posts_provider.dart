import 'package:flutter/material.dart';
import 'package:task_mid_level/task3/view/controller/api/fetch_all_posts.dart';

import '../../../model/posts_model.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> postList = [];
  // PostsProvider() {
  //   getAllPosts();
  // }
  Future getAllPosts(context) async {
    await FetchAllPostsApi.fetchData(topLoader: true, context: context ).then((value) {
      postList = value!.listData!;
      notifyListeners();
    });
    notifyListeners();
  }
}
