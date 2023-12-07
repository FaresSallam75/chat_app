import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:chat_app/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraControllerImp extends GetxController {
  late CameraController cameraController;
  late Future<void> cameraValue;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  File? fileImage;
  File? videoPath;
  File? galleryFile;
  File? fileData;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0.0;

  @override
  void onInit() {
    cameraController = CameraController(camera[0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  takePhoto(String roteName) async {
    try {
      XFile xFileStory = await cameraController.takePicture();
      fileImage = File(xFileStory.path);
      Get.toNamed(roteName);
      update();
    } catch (e) {
      print("camera exception ================================ $e");
    }
  }

  startVideo() async {
    await cameraController.startVideoRecording();
    isRecording = true;
    update();
  }

  stopVideo(String roteName) async {
    XFile? xFileStopVideo = await cameraController.stopVideoRecording();
    isRecording = false;
    if (galleryFile == null && fileImage == null) {
      videoPath = File(xFileStopVideo.path);
      Get.toNamed(roteName, arguments: {"video": videoPath});
      update();
    }
  }

  flashWorking() {
    flash = !flash;
    update();
    flash
        ? cameraController.setFlashMode(FlashMode.torch)
        : cameraController.setFlashMode(FlashMode.off);
    update();
  }

  cameraFront() async {
    isCameraFront = !isCameraFront;
    transform = transform + pi;
    update();
    int cameraPosition = isCameraFront ? 0 : 1;
    cameraController =
        CameraController(camera[cameraPosition], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
    update();
  }

  goToGallery(String roteName) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("image after ====================================== $image ");
      galleryFile = File(image.path);
      Get.toNamed(roteName);
    } else {
      print("image null ====================================== $image ");
    }
    update();
  }

  goToFiles(String roteName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );
    if (result != null) {
      // ignore: unused_local_variable
      fileData = File(result.paths.first!); //result.files.single.path!
      Get.toNamed(roteName);
    }
    update();
  }
  /*  static Future<File> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null) return null;
    return File(result.paths.first);
  } */
}
