class AppLink {
  //10.0.0.2
  static const String server = "https://faressallam.online/chat_app"
      //"http://10.0.2.2/chat_app"
      // "http://faressallam.infinityfreeapp.com/"
      ;

  // Auth
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String searchUser = "$server/auth/search.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String getNotifyVerifyCode = "$server/auth/sendnotify.php";
  static const String getTotalCountUsers = "$server/auth/countusers.php";
  static const String getNotifyVerifyCodeForgetPassword =
      "$server/forgetpassword/sendnotify.php";
  static const String resendCode = "$server/auth/resend.php";
  static const String resendCodeForgetPassword =
      "$server/forgetpassword/resend.php";
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";

  // picture
  static const String imageStatic = "$server/upload";
  static const String imageUsers = "$imageStatic/usersphotos/photos";
  static const String imageStory = "$imageStatic/storiesphoto/photos";
  static const String videoStory = "$imageStatic/storiesphoto/videos";

  static const String imageChats = "$imageStatic/photochats/photos";
  static const String audioChats = "$imageStatic/photochats/audios";
  static const String videoChats = "$imageStatic/photochats/videos";
  
  static const String groupChatImage = "$imageStatic/groupchat/photos";
  static const String groupChatVideo = "$imageStatic/groupchat/videos";
  static const String groupChataudio = "$imageStatic/groupchat/audios";

  static const String defaultErrorImage = "$imageStatic//dark.png";

  // Get All Users
  static const String getUsers = "$server/auth/view.php";

  //  Messages
  static const String getUsersMessage = "$server/messages/viewuserschats.php";
  static const String searchUsersMessage = "$server/messages/search.php";
  static const String sendMessages = "$server/messages/sendmessags.php";
  static const String getMessages = "$server/messages/showmessage.php";
  static const String deleteMessage = "$server/messages/deletemessage.php";

  static const String deleteFileMessage =
      "$server/messages/deletemessagefile.php";
  static const String deleteAllChat = "$server/messages/deleteallchat.php";
  static const String getAllPhoto = "$server/messages/allphotos.php";
  // groups
  static const String createGroups = "$server/groups/addgroup.php";
  static const String viewGroups = "$server/groups/viewgroups.php";
  static const String viewGroupsChat =
      "$server/groups/viewgroupsmessage.php";
  static const String sendGroupMessages =
      "$server/groups/sendmessage.php";
  static const String viewGroupMessages =
      "$server/groups/viewmessages.php";
  static const String viewGroupReciever =
      "$server/groups/viewgroupreciever.php";
  static const String addRecieverGroup = "$server/groups/addusers.php";
  static const String removeRecieverGroup =
      "$server/groups/removeuserrecipients.php";
  static const String deleteGroup = "$server/groups/deletegroup.php";
  static const String deletemessagegroup =
      "$server/groups/deletemessagegroup.php";
  static const String getAllPhotoInGroup =
      "$server/groups/allphotos.php";

  //  Stories
  static const String sendStory = "$server/stories/addstory.php";
  // static const String sendStoryImage = "$server/stories/sendstoryimage.php";
  static const String viewStory = "$server/stories/viewstories.php";
  static const String viewOthersStory = "$server/stories/otherviewstories.php";
  static const String deleteStory = "$server/stories/deletestory.php";
  static const String deleteStoryAutomatically =
      "$server/stories/deletestoryautomatically.php";
  static const String searchUserStory = "$server/stories/search.php";

  //setting
  static const String viewSetting = "$server/setting/view.php";
  static const String editSetting = "$server/setting/edit.php";

  static const String addPersonalstatus = "$server/personalstatus/add.php";
  static const String viewPersonalstatus = "$server/personalstatus/view.php";
  static const String editPersonalstatus = "$server/personalstatus/edit.php";
  static const String deletePersonalstatus =
      "$server/personalstatus/delete.php";
}
