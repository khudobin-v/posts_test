import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_test/providers.dart';

class UserCard extends ConsumerWidget {
  final int userId;
  const UserCard({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(userId));
    return user.when(
      data: (user) {
        final initials = user.name
            .toString()
            .split(" ")
            .map((e) => e[0])
            .take(2)
            .join()
            .toUpperCase();
        return Row(
          spacing: 4,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: user.name.toString().length < 15
                        ? Colors.blue
                        : Colors.green,
                  ),
                ),
                Text(
                  initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        );
      },
      error: (error, stackTrace) =>
          Text("Произошла ошибка при получении данных...\n$error"),
      loading: () => Row(
        spacing: 4,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 12,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
