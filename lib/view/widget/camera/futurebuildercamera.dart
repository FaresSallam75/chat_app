import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future<Object?>? future;
  final CameraController controller;
  const CustomFutureBuilder(
      {super.key, required this.future, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, // controller.cameraValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
              height: MediaQuery.of(context).size.height - 100,
              child: CameraPreview(controller)); //controller.cameraController
        } else {
          return Center(
            child: Container(
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
