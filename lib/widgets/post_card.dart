import 'package:flutter/material.dart';
import 'package:posts_test/widgets/user_card.dart';

class PostCard extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;
  const PostCard({
    super.key,
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

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
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Text("#$id", style: TextStyle(fontSize: 8)),
              ],
            ),
            Text(
              body,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            UserCard(userId: userId),
          ],
        ),
      ),
    );
  }
}
