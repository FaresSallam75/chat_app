// ignore_for_file: invalid_use_of_protected_member
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/class/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelocomeScreen extends StatefulWidget {
  const WelocomeScreen({super.key});

  @override
  State<WelocomeScreen> createState() => _WelocomeScreenState();
}

class _WelocomeScreenState extends State<WelocomeScreen>
    with SingleTickerProviderStateMixin {
  //WelcomeScreenControllerImp controller = Get.put(WelcomeScreenControllerImp());

  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 8), upperBound: 1.0);
    animation = ColorTween(begin: Colors.lightBlueAccent, end: Colors.white)
        .animate(animationController!);

    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    animationController!.removeListener(() {});
    animationController!.removeStatusListener((status) {});
    animationController!.clearListeners();
    animationController!.clearStatusListeners();
    animation!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*   WelcomeScreenControllerImp controller =
        Get.put(WelcomeScreenControllerImp()); */

    // ignore: unused_element

    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: animation!.value,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/images/logo.png',
                      height: 60.0, color: AppColor.blueDark),
                ),
                Hero(
                  tag: "logo",
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          color: AppColor.blueDark,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 1000),
                      ),
                    ],
                    /*  pause: const Duration(milliseconds: 500),
                    displayFullTextOnTap: true,
                    totalRepeatCount: 0,
                    stopPauseOnTap: true, */
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: "Log In",
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Get.toNamed(AppRotes.login);
                }),
            RoundedButton(
                title: "Register",
                colour: Colors.blueAccent,
                onPressed: () {
                  Get.toNamed(AppRotes.register);
                }),
          ],
        ),
      ),
    );
  }
}
