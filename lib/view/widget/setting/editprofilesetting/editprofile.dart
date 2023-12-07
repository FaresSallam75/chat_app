import 'package:chat_app/controller/setting/edit_profile_setting_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEditProfile extends StatelessWidget {
  final ImageProvider<Object>? image;
  final String text;
  final String hint;
  final void Function()? onTap;
  final void Function()? onTapTwo;
  final void Function() onTabVal;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? myController;
  const CustomEditProfile({
    super.key,
    required this.image,
    required this.text,
    required this.hint,
    required this.onTap,
    required this.onTapTwo,
    required this.myController,
    required this.onTabVal,
    required this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileSettingController>(
      builder: (controller) => Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                InkWell(
                    onTap: onTap,
                    child: CircleAvatar(radius: 28, backgroundImage: image)),
                const SizedBox(width: 15),
                Text(
                  "Enter Your name and add an optinal\nprofile picture",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 14,
                        letterSpacing: 0.3,
                        wordSpacing: 0.5,
                        color: AppColor.greyDark.withOpacity(0.6),
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: onTapTwo,
              child: Text(
                text, // "Edit",
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: const Divider(color: Colors.black, thickness: 0.5)),
          Container(
            padding: const EdgeInsets.only(left: 25, bottom: 20),
            child: TextFormField(
              onTap: onTabVal,
              onTapOutside: onTapOutside,
              keyboardType: TextInputType.multiline,
              controller: myController,
              decoration: InputDecoration(
                hintText: hint,
              ),
            ),
          )
        ],
      ),
    );
  }
}
