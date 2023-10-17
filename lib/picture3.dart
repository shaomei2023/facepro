import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'ml.dart';
// import 'result.dart';

class PictureScreen extends StatelessWidget {
  String _responseText = 'waiting for response...';
  final XFile picture;
  PictureScreen(this.picture, {super.key});

  // Future<Map<String, dynamic>> sendImageToServer(file_path) async {
  Future<Response> sendImageToServer(file_path) async {
    // void sendImageToServer(file_path) async {
    final dio = Dio();
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file_path),
    });
    String url = 'http://168.138.12.115:8000/upload';
    Response response = await dio.post(url, data: formData);
    _responseText = response.toString();
    // final dynamic result = (response as Map<String, dynamic>)["status"];
    // 处理服务器响应
    // print(response);
    // print(response);
    // print(result);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    var result = sendImageToServer(picture.path);
    print(result.toString());
    print(_responseText);
    // sendImageToServer(picture.path);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(picture.path),
          SizedBox(
              height: deviceHeight / 1.5,
              child: Image.file(File(picture.path))),
          // Text("name: ${result['name']}, distance: ${result['distance']}"),
          Text(_responseText), // 显示响应字符串
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Text Recognition'),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
