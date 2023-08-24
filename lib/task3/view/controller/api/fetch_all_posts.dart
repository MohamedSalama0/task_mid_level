import 'package:flutter/material.dart';
import 'package:task_mid_level/task3/model/posts_model.dart';
import 'package:task_mid_level/task3/network/api_provider.dart';

class FetchAllPostsApi {
  static final ApiProvider _api = ApiProvider();

  static Future<PostsModel?> fetchData({required bool topLoader,required BuildContext context})async{
    final data = await _api.request(
      /// EndPoint
      'https://jsonplaceholder.org/posts',
      body: {},
      currentContext: context,
      method: 'GET',
      topLoader: topLoader,
    );
    print('return: ${data.toString()}');
    if (data != null) {
      return PostsModel.fromJson(data);
    }
    return null;
  }
}
