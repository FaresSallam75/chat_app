import 'package:chat_app/controller/story/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ContentBodyTextStatus extends StatelessWidget {
  const ContentBodyTextStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryControllerImp>(
      builder: (controller) => Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    controller.goToBack();
                  },
                  icon: const Icon(Icons.close, size: 30, color: Colors.white),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.text_fields_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.chageColor();
                },
                icon:
                    const Icon(Icons.color_lens, size: 30, color: Colors.white),
              )
            ],
          ),
          const Spacer(),
          Center(
            child: TextFormField(
              onChanged: (value) {
                controller.onChanged(value);
              },
              controller: controller.text,
              style: const TextStyle(color: Colors.white, fontSize: 23),
              scrollPadding: const EdgeInsets.only(top: 8, left: 8),
              maxLines: 10,
              minLines: 2,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type a Status",
                hintStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          if (controller.sendButton == true)
            Container(
              color: Colors.black45,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_border_purple500_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  const Text(
                    "Status (Contacts)",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue.shade900,
                    child: GestureDetector(
                      onTap: () {
                        controller.sendStory();
                      },
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
