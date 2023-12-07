import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/controller/auth/signup_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:chat_app/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigupControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SigupControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding:
                const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 20.0),
            child: Form(
              key: controller.formState,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                    child: Row(
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
                                'Register',
                                textStyle: const TextStyle(
                                  fontSize: 30.0,
                                  color: AppColor.blueDark,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 1000),
                              ),
                            ],
                            /*  totalRepeatCount: 0,
                            pause: const Duration(milliseconds: 500),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true, */
                          ),
                        )
                      ],
                    ),
                  ),
                  /*    const SizedBox(
                      height: 48.0,
                    ), */
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 15, "username");
                    },
                    labl: "username",
                    hinText: "Enter Your Username",
                    iconData: Icons.phone,
                    myController: controller.username,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 8, 30, "email");
                    },
                    labl: "email",
                    hinText: "Enter Your Email",
                    iconData: Icons.phone,
                    myController: controller.email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 5, 15, "phone");
                    },
                    labl: "phone",
                    hinText: "Enter Your Phone",
                    iconData: Icons.phone,
                    myController: controller.phone,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 4, 15, "password");
                    },
                    labl: "password",
                    hinText: "Enter Your Password",
                    iconData: Icons.phone,
                    myController: controller.password,
                    obscuretext: controller.isShowPassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: AppColor.blueDark,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: CustomButtonAuth(
                        text: "Continue",
                        color: AppColor.blueDark,
                        onBressed: () {
                          controller.goToPageContinue();
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If you have account click here",
                        style: Theme.of(context)
                            .textTheme
                            // ignore: deprecated_member_use
                            .headline1!
                            .copyWith(color: AppColor.black, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(AppRotes.login);
                        },
                        child: Text(
                          "Sign In",
                          style: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .headline1!
                              .copyWith(color: AppColor.blueDark, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
