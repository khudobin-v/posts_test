import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_test/models/post.dart';
import 'package:posts_test/models/user.dart';

final dioProvider = Provider((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {"Accept": "application/json, text/plain, */*"},
    ),
  );
});

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get("/posts");
  final raw = response.data as List<dynamic>;
  return raw.map((e) => Post.fromJson(e)).toList();
});

final userProvider = FutureProvider.family<User, int>((ref, id) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get("/users/$id");
  final raw = response.data as Map<String, dynamic>;
  return User.fromJson(raw);
});
