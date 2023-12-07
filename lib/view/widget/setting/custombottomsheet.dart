import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customBottomSheet(
  BuildContext context,
  Key? keyState,
  TextEditingController? controller,
  void Function(String)? onChanged,
  String? hintText,
  void Function()? onTapOne,
  void Function()? onTapTwo,
  int? maxLength,
) {
  showModalBottomSheet(
    useSafeArea: true,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context,
    isScrollControlled: true, // This makes it full-screen
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          color: AppColor.backGround,
          height: Get.height - 100,

          // padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey.shade200,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 5.0),
                  //color: AppColor.secondColor,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: onTapOne,
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .headline6!
                              .copyWith(fontSize: 16, color: AppColor.blueDark),
                        ),
                      ),
                      Text(
                        "About ($maxLength)",
                        style: Theme.of(context)
                            .textTheme
                            // ignore: deprecated_member_use
                            .headline6!
                            .copyWith(fontSize: 16, color: AppColor.black),
                      ),
                      InkWell(
                        onTap: onTapTwo,
                        child: Text(
                          "Save",
                          style: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .headline6!
                              .copyWith(fontSize: 16, color: AppColor.blueDark),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.grey.shade200,
                height: 300,
                width: Get.width,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: keyState,
                  child: TextFormField(
                    //maxLength: maxLength,

                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: controller,
                    onChanged: onChanged,
                    // autofocus: true,
                    canRequestFocus: true,
                    //focusNode: controller.focusNode,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    autocorrect: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.green.shade900,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
