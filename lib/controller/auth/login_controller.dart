import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/authdata/authdata.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpPage();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  AuthData authData = AuthData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late UsersModel usersModel;
  bool isShowPassword = true;
  String? usersid;
  String checkIndex = "one";

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignin() async {
    await googleSignIn.signIn().then((value) {
      String user = value!.displayName!;
      String photo = value.photoUrl!;
      String email = value.email;
      // ignore: unused_local_variable
      String id = value.id;
      print("================================");
      print("=================== $user ");
      print("=================== $photo ");
      print("=================== $email ");
      print("================================");
      if (email.isEmail && email == email) {
        Get.offNamed(AppRotes.homePageScreen);
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Get.offNamed(AppRotes.homePageScreen);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    super.dispose();
  }

  @override
  goToSignUpPage() {
    Get.offNamed(AppRotes.register);
  }

  @override
  login() async {
    //var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await authData.postData(email.text, password.text);
      print("=============================== Controller ?? $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1" ||
              response['data']['users_approve'] == 1) {
            usersid = myServices.sharedPref.getString("id");
            myServices.sharedPref
                .setString("id", response['data']['users_id'].toString());
            myServices.sharedPref
                .setString("username", response['data']['users_name']);
        
            myServices.sharedPref
                .setBool(myServices.sharedPref.getString("id")!, true);
                //myServices.sharedPref.remove("NewImage");
            myServices.sharedPref
                .setString("image", response['data']['users_image']);
            myServices.sharedPref
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPref.setString("step", "2");
            Get.offNamed(AppRotes.homePageScreen);
          } else {
            myServices.sharedPref
                .setString("id", response['data']['users_id'].toString());
            usersid = myServices.sharedPref.getString("id")!;

            Get.offNamed(AppRotes.verifyCodeSignUp,
                arguments: {"email": email.text, "one": checkIndex});
          }

          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$usersid");
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: "Email OR Password Not Correct",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  goToForgetPassword() {
    Get.toNamed(AppRotes.forgetPassword);
  }
}

/* class LoginApi {
  static final googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
  static Future signOut = googleSignIn.signOut();

  /*  loginUser() async {
    var user = await LoginApi.login();
    if (user != null) {
      print("ok ==========================");
      print("ok ==========================");
      print("ok ==========================");
      print(user.displayName);
      print(user.email);
    }
  } */
} */
