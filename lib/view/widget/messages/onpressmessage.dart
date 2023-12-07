import 'package:flutter/cupertino.dart';

class OnPressMessage extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const OnPressMessage(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(child: child, actions: [
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.star,
        child: Text("Star"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.reply,
        child: Text("Reply"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.arrowshape_turn_up_right,
        child: Text("Forward"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.folder_fill_badge_person_crop,
        child: Text("Copy"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.info,
        child: Text("Info"),
      ),
      CupertinoContextMenuAction(
        
        isDestructiveAction: true,
        onPressed: onPressed,
        trailingIcon: CupertinoIcons.delete,
        child: const Text("Delete"),
      )
    ]);

    /* CupertinoContextMenu(
    
      actions: [
      
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.star,
        child: Text("Star"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.reply,
        child: Text("Reply"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.arrowshape_turn_up_right,
        child: Text("Forward"),
      ),
      const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.folder_fill_badge_person_crop,
        child: Text("Copy"),
      ),
      /*  const CupertinoContextMenuAction(
        trailingIcon: CupertinoIcons.info,
        child: Text("Info"),
      ), */
      CupertinoContextMenuAction(
        isDestructiveAction: true,
        onPressed: onPressed,
        trailingIcon: CupertinoIcons.delete,
        child: const Text("Delete"),
      )
    ], child: child); */
  }
}
