import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';

class GroupVideoCallController extends GetxController {
  String appId = "cc9d6bc6c9c3460c85f7c8f4c6f1d931";
  String channel = "chatsapp";
  String tempToken =
      "007eJxTYEis3m7HsdDok0q+jcO3Tc79STOztzRfn8Hd8/dM89LaWRwKDMnJlilmSclmyZbJxiZmBskWpmnmyRZpJslmaYYplsaGCcqXUhoCGRkuZ3AzMjIwMrAAMYjPBCaZwSQLmORgSM5ILClOLChgYAAAOiMj1A==";

  AgoraClient agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "cc9d6bc6c9c3460c85f7c8f4c6f1d931",
          channelName: "chatsapp",
          tempToken:
              "007eJxTYDg1I37hyct6ymc2T28sWdPnd1RPdOIys5gXX8wchartnJoUGJKTLVPMkpLNki2TjU3MDJItTNPMky3STJLN0gxTLI0N16X8SWkIZGSoV9zPxMjAyMACxCA+E5hkBpMsYJKDITkjsaQ4saCAgQEAbWIkYg=="));

  @override
  void onInit() {
    super.onInit();
    intialAgora();
  }

  Future<void> intialAgora() async {
    try {
      await agoraClient.initialize();
    } catch (e) {
      print("Agora Exception =================================== $e");
    }
  }
}
