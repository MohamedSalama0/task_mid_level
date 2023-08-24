import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mid_level/task1/view/screens/home/home_scree.dart';
import 'package:task_mid_level/task1/view/screens/login/login_screen.dart';
import 'package:task_mid_level/task1/view/screens/login/provider.dart';
import 'package:task_mid_level/task2/view/counter/counter_provider.dart';
import 'package:task_mid_level/task2/view/counter/counter_screen.dart';
import 'package:task_mid_level/task3/view/controller/state/posts_provider.dart';
import 'package:task_mid_level/task3/view/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        /// [Task 1 (two points done)]
        // home: LoginScreen(),

        /// [Task 2 (1 point done)]
        // home: CounterScreen(),


        home: PostsScreen(),
      ),
    );
  }
}
