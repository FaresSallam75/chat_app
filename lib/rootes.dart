import 'package:chat_app/core/class/middleware.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/view/screen/auth/choose_image.dart';
import 'package:chat_app/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:chat_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:chat_app/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:chat_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:chat_app/view/screen/auth/success_signup.dart';
import 'package:chat_app/view/screen/auth/verifycodesignup.dart';
import 'package:chat_app/view/screen/calls/call_page.dart';
import 'package:chat_app/view/screen/camera/camerapage.dart';
import 'package:chat_app/view/screen/chat/chat_details_details.dart';
import 'package:chat_app/view/screen/chat/chatdetails.dart';
import 'package:chat_app/view/screen/chat/chatwithusers.dart';
import 'package:chat_app/view/screen/chat/creategroupchat.dart';
import 'package:chat_app/view/screen/chat/getnewmember.dart';
import 'package:chat_app/view/screen/chat/sendimage_chat_users.dart';
import 'package:chat_app/view/screen/auth/login.dart';
import 'package:chat_app/view/screen/auth/register.dart';
import 'package:chat_app/view/screen/chat/sendimagechat.dart';
import 'package:chat_app/view/screen/chat/view_video_chat.dart';
import 'package:chat_app/view/screen/groupchat/addpeople.dart';
import 'package:chat_app/view/screen/groupchat/getallgroups.dart';
import 'package:chat_app/view/screen/groupchat/groupchat_camera.dart';
import 'package:chat_app/view/screen/groupchat/groupchatdetails.dart';
import 'package:chat_app/view/screen/groupchat/groupchatwithusers.dart';
import 'package:chat_app/view/screen/groupchat/groupvideocall.dart';
import 'package:chat_app/view/screen/groupchat/videogroupchat.dart';
import 'package:chat_app/view/screen/homepage/homepagechat.dart';
import 'package:chat_app/view/screen/homepage/welcomescreen.dart';
import 'package:chat_app/view/screen/settings/edit_image_profile.dart';
import 'package:chat_app/view/screen/settings/personal_status.dart';
import 'package:chat_app/view/screen/settings/setting_page.dart';
import 'package:chat_app/view/screen/stories/imagestory.dart';
import 'package:chat_app/view/screen/stories/mystatus/show_mystory_details.dart';
import 'package:chat_app/view/screen/stories/show_other_storydetails.dart';
import 'package:chat_app/view/screen/stories/statusscreen.dart';
import 'package:chat_app/view/screen/stories/textstatusscreen.dart';
import 'package:chat_app/view/screen/stories/videostory.dart';
import 'package:chat_app/view/screen/video_audio_calls..dart/video_call.dart';
import 'package:get/get.dart';
import 'view/screen/chat/pdf.dart';
import 'view/screen/chat/video_chat.dart';
import 'view/screen/settings/edit_profile_details.dart';
import 'view/screen/settings/edit_profile_settings.dart';
import 'view/screen/stories/mystatus/mystatusscreen.dart';

List<GetPage<dynamic>>? routes = [
  // Auth

  //GetPage(name: "/", page: () =>   const Check()),

  GetPage(
    name: "/", page: () => const WelocomeScreen(), //const Login() ,
    middlewares: [MyMiddleWare()],
  ),

  GetPage(name: AppRotes.welocomeScreen, page: () => const WelocomeScreen()),

  GetPage(name: AppRotes.selectImageUser, page: () => const SelectImageUser()),

  GetPage(name: AppRotes.login, page: () => const Login()),
  GetPage(name: AppRotes.register, page: () => const Register()),
  GetPage(
    name: AppRotes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRotes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRotes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRotes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRotes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  //GetPage(name: AppRotes.getAllUsers, page: () => const GetAllUsers()),
  GetPage(name: AppRotes.chatDetails, page: () => const ChatDetails()),
  GetPage(
      name: AppRotes.textStatusScreen, page: () => const TextStatusScreen()),
  GetPage(name: AppRotes.statusScreen, page: () => const StatusScreen()),
  GetPage(name: AppRotes.sendImageChat, page: () => const SendImageChat()),
  GetPage(
      name: AppRotes.sendImageChatUsers,
      page: () => const SendImageChatUsers()),
  //GetPage(name: AppRotes.sendImageChat, page: () => const SendImageChat()),
  GetPage(name: AppRotes.imageStory, page: () => const ImageStory()),
  GetPage(name: AppRotes.homePageScreen, page: () => const HomePageScreeen()),
  GetPage(name: AppRotes.getNewChat, page: () => const GetNewChat()),
  GetPage(name: AppRotes.createGroupChat, page: () => const CreateGroupChat()),
  GetPage(name: AppRotes.cameraPage, page: () => const CameraPage()),
  GetPage(name: AppRotes.settingPage, page: () => const SettingPage()),
  // GetPage(name: AppRotes.checkCamera, page: () => const CheckCamera()),
  GetPage(
      name: AppRotes.showOtherStoryDetails,
      page: () => const ShowOtherStoryDetails()),
  GetPage(
      name: AppRotes.showMyStoryDetails,
      page: () => const ShowMyStoryDetails()),
  // GetPage(name: AppRotes.checkVideo, page: () => const CheckVideo()),
  GetPage(name: AppRotes.videoStory, page: () => const VideoStory()),
  GetPage(
      name: AppRotes.myPersonalStatusScreen,
      page: () => const MyPersonalStatusScreen()),

  GetPage(
      name: AppRotes.chatDetailsDetails,
      page: () => const ChatDetailsDetails()),
  GetPage(
      name: AppRotes.chatPageWithUsers, page: () => const ChatPageWithUsers()),
  GetPage(name: AppRotes.callPage, page: () => const CallPage()),
  // GetPage(name: AppRotes.audioCall, page: () => const AudioCall()),
  GetPage(name: AppRotes.videoCall, page: () => const VideoCall()),
  GetPage(name: AppRotes.groupVideoCall, page: () => const GroupVideoCall()),

  // settings
  GetPage(
      name: AppRotes.editProfileSetting,
      page: () => const EditProfileSetting()),
  GetPage(
      name: AppRotes.editProfileDetails,
      page: () => const EditProfileDetails()),
  GetPage(name: AppRotes.editImagePofile, page: () => const EditImagePofile()),
  GetPage(name: AppRotes.videoChatPage, page: () => const VideoChatPage()),
  GetPage(
      name: AppRotes.viewVideoChatPage, page: () => const ViewVideoChatPage()),
  GetPage(
      name: AppRotes.groupChatPage, page: () => const GroupChatPageWithUsers()),
  GetPage(name: AppRotes.addPeopleGroup, page: () => const AddPeopleGroup()),
  GetPage(name: AppRotes.groupCameraPage, page: () => const GroupCameraPage()),
  GetPage(name: AppRotes.videoGroupChat, page: () => const VideoGroupChat()),
  GetPage(name: AppRotes.getAllGroups, page: () => const GetAllGroups()),
  GetPage(
      name: AppRotes.groupChatDetails, page: () => const GroupChatDetails()),
  GetPage(
      name: AppRotes.personalStatus, page: () => const PersonalStatus()),
/*   GetPage(
      name: AppRotes.pdfViewerPage, page: () => const PDFViewerPages()), */

];
