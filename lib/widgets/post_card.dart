import 'package:flutter/material.dart';
import 'package:posts_test/widgets/user_card.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
        side: BorderSide(color: Colors.black12, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Заголовок поста",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Text("#0", style: TextStyle(fontSize: 8)),
              ],
            ),
            const Text(
              "Текст поста... текст поста... текст поста... текст поста... текст поста... текст поста... ",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            UserCard(),
          ],
        ),
      ),
    );
  }
}
