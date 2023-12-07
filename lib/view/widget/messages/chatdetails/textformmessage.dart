import 'package:chat_app/controller/chat/chatdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormFieldMessage extends StatelessWidget {
  const CustomTextFormFieldMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(right: 2.0),
      margin: const EdgeInsets.only(right: 3.0),
      //  padding: EdgeInsets.only(bottom: 4),
      height: 60,
      child: GetBuilder<ChatDetailsControllerImp>(
        builder: (controller) => Form(
          key: controller.formState,
          child: TextFormField(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // ignore: unnecessary_null_comparison, prefer_if_null_operators, unrelated_type_equality_checks
            controller: controller.textEmoji,
            onChanged: (value) {
              controller.onChanged(value);
            },
            focusNode: controller.focusNode,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            //minLines: 1,
            autocorrect: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue.shade900, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue.shade900, width: 1.5),
              ),
              border: InputBorder.none,
              hintText: "Message ${controller.usersModel.usersName}",
              hintStyle: TextStyle(color: Colors.blue.shade900),
              contentPadding: const EdgeInsets.all(10),
              alignLabelWithHint: true,
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
    );
  }
}
