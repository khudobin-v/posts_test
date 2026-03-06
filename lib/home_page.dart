import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posts_test/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<dynamic>> fetchPosts() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
        headers: {
          "User-Agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/",
          "Accept": "application/json, text/plain, */*",
          "Referer": "https://site.com/",
        },
      ),
    );
    final response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Посты",
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w900),
              ),
              const Text(
                "Все посты",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text(
                        "Произошла ошибка при получении данных...\n${snapshot.error}",
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Text("Нет данных для отображения...");
                    }

                    final posts = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostCard(
                          title: post['title'],
                          body: post['body'],
                          id: post['id'],
                          userId: post['userId'],
                        );
                      },
                      itemCount: posts.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
