import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/controller/auth/login_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:chat_app/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: controller.formState,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                /* Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [ */
                Container(
                  margin: const EdgeInsets.only(top: 150.0, bottom: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 60.0,
                          color: AppColor.blueDark,
                        ),
                      ),
                      Hero(
                        tag: "logo",
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Login',
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
                /*  const SizedBox(
                      height: 48.0,
                    ), */
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, "email");
                  },
                  labl: "email",
                  hinText: "Enter Your Email",
                  iconData: Icons.email,
                  myController: controller.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 4, 30, "password");
                  },
                  labl: "password",
                  hinText: "Enter Your Password",
                  iconData: Icons.lock,
                  myController: controller.password,
                  obscuretext: controller.isShowPassword,
                  onTapIcon: () {
                    controller.showPassword();
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "Forget Password ?",
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                /* Card(
                          child: InkWell(
                            onTap: () async {
                              controller.signInWithGoogle();
                              //  controller.signInWithGoogle();
                              // controller.signInWithGoogle();
                              /* var user = await LoginApi.login();
                              if (user != null) {
                                print("ok ==========================");
                                print("ok ==========================");
                                print("ok ==========================");
                                print(user.displayName);
                                print(user.email);
                                Get.offNamed(AppRotes.homePageScreen);
                              }  */
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.home),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Google SignIn")
                              ],
                            ),
                          ),
                        ), */
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: AppColor.blueDark,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: CustomButtonAuth(
                      text: "Login",
                      color: AppColor.blueDark,
                      onBressed: () {
                        controller.login();
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you didn't have account click here",
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
                        Get.offNamed(AppRotes.register);
                      },
                      child: Text(
                        "Sign up",
                        style: Theme.of(context)
                            .textTheme
                            // ignore: deprecated_member_use
                            .headline1!
                            .copyWith(color: AppColor.blueDark, fontSize: 16),
                      ),
                    ),
                  ],
                ),

                //   ],
                //  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
