import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showAlert(BuildContext context, void Function() onPresed, void Function() onPresedIconCopy) {
   
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: onPresed,
          child: const Text("Save Image"),
        ),
        CupertinoActionSheetAction(
          onPressed: onPresedIconCopy,
          child: const Text("Copy"),
        ),
        
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel")),
    ),
  );
}
