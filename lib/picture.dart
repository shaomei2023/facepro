import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PictureScreen extends StatefulWidget {
  final XFile picture;

  // PictureScreen(this.picture, {Key key}) : super(key: key);
  PictureScreen(this.picture) : super();

  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  String _responseText = 'waiting for response...';

  Future<Response> sendImageToServer(String file_path) async {
    final dio = Dio();
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file_path),
    });
    String url = 'http://168.138.12.115:8000/upload';
    Response response = await dio.post(url, data: formData);
    setState(() {
      _responseText = response.toString();
    });
    return response;
  }

  @override
  void initState() {
    super.initState();
    sendImageToServer(widget.picture.path);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.picture.path),
          SizedBox(
            height: deviceHeight / 1.5,
            child: Image.file(File(widget.picture.path)),
          ),
          Text(_responseText),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     ElevatedButton(
          //       child: const Text('Next'),
          //       onPressed: () {},
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
