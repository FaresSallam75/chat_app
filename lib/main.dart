import 'package:camera/camera.dart';
import 'package:chat_app/controller/bindings/intialbonding.dart';
import 'package:chat_app/core/public_permission.dart';
import 'package:chat_app/core/translation.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:chat_app/rootes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:device_preview/device_preview.dart';

late List<CameraDescription> camera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  camera = await availableCameras();
  HttpOverrides.global = MyHttpOverrides();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PublicPermissions controller = Get.put(PublicPermissions());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      locale: controller.language,
      translations: MyTranslation(),
      theme: controller.appTheme,
      getPages: routes,
      /*    onInit: () {
        controller.requestCameraPermission();
        controller.requestMicrophonePermission();
      }, */
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
 

 /*  background_image: "assets/images/splash.png"
  image: "assets/images/splash.png"
  android_gravity: fill
  android_12:
    image: "assets/images/splash.png" */