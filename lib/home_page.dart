import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_test/providers.dart';
import 'package:posts_test/widgets/post_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(postsProvider);
                  },
                  child: posts.when(
                    data: (posts) => ListView.builder(
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostCard(
                          title: post.title,
                          body: post.body,
                          id: post.id,
                          userId: post.userId,
                        );
                      },
                      itemCount: posts.length,
                    ),
                    error: (error, stackTrace) => Text(
                      "Произошла ошибка при получении данных...\n$error",
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
