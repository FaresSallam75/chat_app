import 'package:flutter/material.dart';

class TextFormForImage extends StatelessWidget {
  final TextEditingController myController;
  final void Function()? onTap;

  const TextFormForImage({
    super.key,
    required this.myController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: TextFormField(
        controller: myController,
        maxLines: 5,
        minLines: 1,
        style: const TextStyle(fontSize: 17, color: Colors.white),
        decoration: InputDecoration(
            hintText: "Add Caption",
            hintStyle: const TextStyle(fontSize: 17, color: Colors.white),
            prefixIcon: const Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.white,
              size: 25,
            ),
            suffixIcon: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue.shade900,
              child: GestureDetector(
                //  onLongPress: onLongPress,
                //  onLongPressUp: onLongPressUp,
                onTap: onTap,
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
