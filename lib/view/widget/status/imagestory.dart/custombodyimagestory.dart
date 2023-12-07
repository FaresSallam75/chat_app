import 'dart:io';
import 'package:chat_app/view/widget/status/imagestory.dart/textformmessageforImage.dart';
import 'package:flutter/material.dart';

class CustomBodyImageStory extends StatelessWidget {
  final File file;
  final TextEditingController myController;
  final void Function()? onTap;
  const CustomBodyImageStory({
    super.key,
    required this.file,
    required this.myController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 180,
            width: MediaQuery.of(context).size.width,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black45,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: TextFormForImage(myController: myController, onTap: onTap),
            ),
          )
        ],
      ),
    );
  }
}
