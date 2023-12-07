import 'package:flutter/material.dart';

class TextAndSearchStatus extends StatelessWidget {
  final String text;
  final String? hintText;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const TextAndSearchStatus({
    super.key,
    required this.text,
    required this.hintText,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.headline2!.copyWith(),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 33,
            width: MediaQuery.of(context).size.width - 10,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              controller: myController,
              onChanged: onChanged,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onPressedSearch,
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey.shade800,
                        size: 20,
                      ),
                    ),
                    /*     const Text(
                                    "txtSearch",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ) */
                  ],
                ),
                filled: true,
                fillColor: Colors.grey.shade400,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle:
                    // ignore: deprecated_member_use
                    Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        textBaseline: TextBaseline.alphabetic),
                contentPadding: const EdgeInsets.all(10),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
