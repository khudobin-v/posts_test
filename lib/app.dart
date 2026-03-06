import 'package:flutter/material.dart';
import 'package:posts_test/home_page.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "GolosText",
        scaffoldBackgroundColor: Color.fromARGB(255, 217, 217, 217),
        cardTheme: const CardThemeData(
          color: Color.fromARGB(255, 217, 217, 217),
        ),
      ),
      home: HomePage(),
    );
  }
}
