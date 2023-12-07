/* 

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:chat_app/controller/calling_controller/video_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallCall extends StatelessWidget {
  const CallCall({super.key});

  @override
  Widget build(BuildContext context) { 
        VideoCallController controller = Get.put(VideoCallController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Agora"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset("assets/images/logo.png"),
              TextFormField(
                controller: controller.channelController,
                decoration: InputDecoration(
                    errorText: controller.validateError
                        ? "Channel Name is Mandatory "
                        : null,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: "Channel Name"),
              ),
              RadioListTile(
                title: const Text("Broadcact"),
                value: ClientRole.Broadcaster,
                groupValue: controller.clientRole,
                onChanged: (ClientRole? value) {
                  controller.clientRole = value;
                  controller.update();
                },
              ),
              RadioListTile(
                title: const Text("Audience"),
                value: ClientRole.Broadcaster,
                groupValue: controller.clientRole,
                onChanged: (ClientRole? value) {
                  controller.clientRole = value;
                },
              ),
              MaterialButton(
                onPressed: onPressed,
                child: Text("Join"),
              )
            ],
          ),
        ),
      ),
    ); 
  }
} */