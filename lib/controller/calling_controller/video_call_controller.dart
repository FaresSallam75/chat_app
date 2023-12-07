import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';

class VideoCallController extends GetxController {
  /*  String appId = "cc9d6bc6c9c3460c85f7c8f4c6f1d931";
  String channel = "chatsapp";
  String tempToken =
      "007eJxTYMhbZbV3Nt8a9ePFyiyb1i0Ji8gq45B3j4yONHxX6rxBNE+BITnZMsUsKdks2TLZ2MTMINnCNM082SLNJNkszTDF0tjw1b3M1IZARoagLjUWRgZGBhYgBvGZwCQzmGQBkxwMyRmJJcWJBQUMDABKviGZ"; */

  AgoraClient agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "cc9d6bc6c9c3460c85f7c8f4c6f1d931",
          channelName: "chatsapp",
          tempToken:
              "007eJxTYHCYkvNu7u/F5bL2y1u9vPpfN9efSw9V3bIm1Vwrakb0qnAFhuRkyxSzpGSzZMtkYxMzg2QL0zTzZIs0k2SzNMMUS2PDtH05qQ2BjAx102+xMjIwMrAAMYjPBCaZwSQLmORgSM5ILClOLChgYAAAZaMkfg=="));

  Future<void> intialAgora() async {
    await agoraClient.initialize();
  }

  @override
  void onInit() {
    super.onInit();
    intialAgora();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
