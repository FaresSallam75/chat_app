import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(right: 2.0),
      margin: const EdgeInsets.only(right: 3.0),
      height: 60,
      child: GetBuilder<ChatWithUsersController>(
        builder: (controller) => Form(
          key: controller.formStateState,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: controller.textEmoji,
                    onChanged: (value) {
                      controller.onChanged(value);
                    },
                    // autofocus: true,
                    canRequestFocus: true,
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
                      hintText:
                          "Message ${controller.usersMessagesModel!.usersName}",
                      hintStyle: TextStyle(color: Colors.blue.shade900),
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                      /* suffixIcon: Icon(
                        Icons.attach_file,
                        color: Colors.blue.shade900,
                      ), */
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
