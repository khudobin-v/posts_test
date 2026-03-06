import 'package:flutter/material.dart';
import 'package:posts_test/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 48),
              const Text(
                "Посты",
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w900),
              ),
              const Text(
                "Все посты",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Column(
                spacing: 6,
                children: [PostCard(), PostCard(), PostCard()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
