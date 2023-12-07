import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customTextFormFieldCreateGroup(Key? key, String? Function(String?)? validator,
    TextEditingController? controller, Function()? onPressedAdd, Function()? onPressedCancel) {
  return Get.defaultDialog(
    title: "Enter Group Name",
    content: Form(
      key: key,
      child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter Group Name",
            hintStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 13,
                textBaseline: TextBaseline.alphabetic),
            contentPadding: const EdgeInsets.all(10),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.blueDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.blueDark),
            ),
            filled: true,
          )),
    ),
    confirm: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColor.blueDark),
      ),
      textColor: Colors.white,
      color: AppColor.blueDark,
      onPressed: onPressedAdd,
      child: const Text("Create"),
    ),
    cancel: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColor.blueDark),
      ),
      textColor: Colors.white,
      color: AppColor.blueDark,
      onPressed: onPressedCancel,
      child: const Text("Cancel"),
    ),
  );
}
