import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCommunityPage extends StatelessWidget {
  const CustomCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Communities",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/Communities.jpg",
              height: 150,
              width: 150,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
            child: Text(
              "Introducing Communities",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                '''Easily organize your related groups and send\nannouncements. Now, your communities, like\nneighborhoods or school, can have their own\nspace.''',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      letterSpacing: 0.5,
                      fontSize: 16,
                      color: AppColor.greyDark.withOpacity(0.9),
                    )
                /* TextStyle(
                letterSpacing: 0.5,
                fontSize: 16,
                color: Colors.grey.shade700,
              ), */
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 1.5,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Start a Community",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sans"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
