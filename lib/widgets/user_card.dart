import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final int userId;
  const UserCard({super.key, required this.userId});

  Future<dynamic> fetchUser(int id) async {
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
      "https://jsonplaceholder.typicode.com/users/$id",
    );
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUser(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
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
          );
        }

        if (snapshot.hasError) {
          return Text("Произошла ошибка при получении данных...");
        }

        final user = snapshot.data;
        final initials = user['name']
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
                    color: user['name'].toString().length < 15
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
              user['name'],
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}
