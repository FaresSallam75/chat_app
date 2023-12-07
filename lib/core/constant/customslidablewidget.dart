import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget customSlidableWidget(
  Key? key,
  void Function(BuildContext)? onPressedOne,
  void Function(BuildContext)? onPressedTwo,
  void Function(BuildContext)? onPressedThree,
  void Function(BuildContext)? onPressedFour,
  Widget child,
) {
  return Slidable(
      key: key, // ValueKey(controller.groupModelTwo[index]),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: onPressedOne,
            /* (BuildContext context) {
            controller.deleteGroup(controller.groupModelTwo[index].groupId!);
          }, */
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: onPressedTwo, //(BuildContext context) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: onPressedThree, //(BuildContext context) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: onPressedFour,
            /* (BuildContext context) {
            Get.back();
          }, */
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.close,
            label: 'Close',
          ),
        ],
      ),
      child: child);
}
