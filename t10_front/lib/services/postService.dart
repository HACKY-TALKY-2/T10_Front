import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/PostModel.dart';

class PostService extends ChangeNotifier {
  List<GetPost> postsList = [];
  void uploadPost(PostPost postInfo) async {
    Map<String, dynamic> data = postInfo.toJson();
    try {
      Response response =
          await Dio().post("localhost:8080/post/add", data: data);
      if (response.statusCode == 200) {
        print('POST 요청 성공');
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  void getAllPost() async {
    try {
      Response response = await Dio().get("localhost:8080/post/all");
      if (response.statusCode == 200) {
        print('GET 요청 성공');
        for (Map<String, dynamic> item in response.data) {
          GetPost post = GetPost.fromJson(item);
          postsList.add(post);
        }
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }

  void joinPost(JoinPost post) async {
    Map<String, dynamic> data = post.toJson();
    try {
      Response response =
          await Dio().post("localhost:8080/post/join", data: data);
      if (response.statusCode == 200) {
        print('POST 요청 성공');
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }
}
