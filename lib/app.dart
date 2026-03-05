import 'package:flutter/material.dart';
import 'package:posts_test/home_page.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "GolosText"),
      home: HomePage(),
    );
  }
}
