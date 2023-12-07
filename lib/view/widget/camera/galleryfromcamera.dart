import 'package:flutter/material.dart';

class CustomGalleryFromCamera extends StatelessWidget {
  final void Function()? onTap;
  const CustomGalleryFromCamera({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade900,
        child: InkWell(
          onTap: onTap,
                            //controller.goToGallery();
          
          child: const Icon(
            Icons.photo_outlined,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
