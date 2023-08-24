import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mid_level/task3/view/controller/state/posts_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostsProvider>(context, listen: false).getAllPosts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    final list = Provider.of<PostsProvider>(context).postList;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        child: Container(
                            color: Colors.blue,
                            padding: const EdgeInsets.all(10),
                            child: Text(list[index].title ?? 'test'))),
                  ],
                ),
                SizedBox(height: height * 0.04),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.indigo,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          list[index].content ?? 'test',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
