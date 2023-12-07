import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';

customShowBottomSheet(
    BuildContext context,
    Key? key,
    TextEditingController? controller,
    void Function(String)? onChanged,
    String hintText,
    String text,
    void Function()? onBressed) {
  return showModalBottomSheet(
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
          height: 150,
          // padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                //color: Colors.grey.shade200,
                height: 50,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: key, //controller.formState,
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: controller, //controller.text,
                    onChanged: onChanged, // (val) {},
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
                        borderSide: const BorderSide(
                            color: AppColor.blueDark, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: AppColor.blueDark, width: 1.5),
                      ),
                      border: InputBorder.none,
                      hintText: hintText, //"add status",
                      hintStyle: const TextStyle(
                        color: AppColor.blueDark,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
              CustomButtonAuth(
                  text: text, //"add",
                  color: AppColor.blueDark,
                  onBressed: onBressed)
            ],
          ),
        ),
      );
    },
  );
}
