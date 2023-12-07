import 'dart:io';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ShowBottomSheet {
  File? file;
  uploadImage(context, imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    file = File(xFile!.path);
    Get.toNamed(AppRotes.sendImageChat);
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.grey.shade400,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Choose Image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  uploadImage(context, ImageSource.gallery);
                  Get.back();
                  // setState(() {});
                },
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.photo_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  uploadImage(context, ImageSource.camera);
                  Get.back();
                  // setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "From Camera",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShowBottomSheetStory {
  File? file;
  uploadImage(context, imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    file = File(xFile!.path);
    Get.toNamed(AppRotes.imageStory);
  }

  showBottomSheetStory(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.grey.shade400,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Choose Image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  uploadImage(context, ImageSource.gallery);
                  Get.back();
                  // setState(() {});
                },
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.photo_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  uploadImage(context, ImageSource.camera);
                  Get.back();
                  // setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "From Camera",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
