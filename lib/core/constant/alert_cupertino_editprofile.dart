import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showAlertEdit(
  BuildContext context,
  void Function() onPresedDelete,
  void Function() onPresedUseAvatar,
  void Function() onPresedTakePhoto,
  void Function() onPresedChoosePhoto,
) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          isDefaultAction: true,
          isDestructiveAction: true,
          onPressed: onPresedDelete,
          child: const Text("Delete Photo"),
        ),
        CupertinoActionSheetAction(
          onPressed: onPresedUseAvatar,
          child: const Text("Use Avatar"),
        ),
        CupertinoActionSheetAction(
          onPressed: onPresedTakePhoto,
          child: const Text("Take Photo"),
        ),
        CupertinoActionSheetAction(
          onPressed: onPresedChoosePhoto,
          child: const Text("Choose Photo"),
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
