import 'package:flutter/material.dart';
import 'package:get/get.dart';

showBottomSheetDesign(
    BuildContext context,
    Widget child,
    TextEditingController? controller,
    Function()? onPressed,
    Function()? onPressedAddPeople,
    Key? key,
    String? Function(String?)? validator) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    context: context,
    isScrollControlled: true, // This makes it full-screen
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          height: Get.height - 200,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: onPressedAddPeople,
                    icon: Icon(
                      Icons.groups_2,
                      color: Colors.blue.shade900,
                      size: 30,
                    ),
                  ),
                  /*  IconButton(
                    onPressed: () {
                      customTextFormFieldCreateGroup(
                          key, validator, controller, onPressed);
                    },
                    icon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: Colors.blue.shade900,
                      size: 30,
                    ),
                  ), */
                ],
              ),
              child,
            ],
          ),
        ),
      );
    },
  );
}
