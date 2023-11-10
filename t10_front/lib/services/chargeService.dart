import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:t10_front/model/PointModel.dart';

class ChargeService extends ChangeNotifier {
  void plusPoint(PostPoint pointInfo) async {
    Map<String, dynamic> data = pointInfo.toJson();
    try {
      Response response = await Dio()
          .post("http://192.168.8.20:8080/member/charge", data: data);
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
