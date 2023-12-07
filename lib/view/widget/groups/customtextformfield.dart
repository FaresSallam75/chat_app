import 'package:chat_app/controller/groups/groupchat_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupCustomTextFormField extends StatelessWidget {
  const GroupCustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.only(right: 2.0),
      margin: const EdgeInsets.only(right: 3.0),
      height: 60,
      child: GetBuilder<GroupChatController>(
        builder: (controller) => Form(
          key: controller.formState,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: controller.textMessage,
                    onChanged: (value) {
                      controller.onChanged(value);
                    },
                    focusNode: controller.focusNode,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    autocorrect: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 1.5),
                      ),
                      border: InputBorder.none,
                      hintText: "Message ..",
                      hintStyle: TextStyle(color: Colors.blue.shade900),
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                      //suffixIcon:Icon(Icons.attach_file, color: Colors.blue.shade900),
                      prefixIcon: IconButton(
                        onPressed: () {
                          controller.showImoji();
                        },
                        // ignore: unrelated_type_equality_checks
                        icon: Icon(Icons.emoji_emotions_outlined,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* PopupMenuButton(
                        splashRadius: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        icon: Icon(Icons.attach_file,
                            color: Colors.blue.shade900),
                        onSelected: (value) {
                          // your logic
                        },
                        itemBuilder: (BuildContext bc) {
                          return [
                            PopupMenuItem(
                              value: '/hello',
                              enabled: true,
                              textStyle: TextStyle(color: Colors.blue.shade900),
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Text("Delete"),
                                  Spacer(),
                                  Icon(Icons.delete)
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: '/about',
                              child: Text("About"),
                            ),
                            const PopupMenuItem(
                              value: '/contact',
                              child: Text("Forward"),
                            )
                          ];
                        },
                      ), */