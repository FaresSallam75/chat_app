import 'package:chat_app/core/class/rootesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/im1.png"),
              radius: 40,
            ),
            title: Text("Fares Sallam"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRotes.audioCall);
                },
                icon: const Icon(Icons.call),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRotes.videoCall);
                },
                icon: const Icon(Icons.video_call),
              ),
            ],
          )
        ],
      ),
    );
  }
}
