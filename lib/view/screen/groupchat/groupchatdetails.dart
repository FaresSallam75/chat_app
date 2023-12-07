import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/groups/groupchatdetails.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class GroupChatDetails extends StatelessWidget {
  const GroupChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GroupChatDetailsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<GroupChatDetailsController>(
          builder: (controller) => Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back,
                          size: 25, color: Colors.blue.shade900),
                    ),
                    Text(
                      "You on ${Jiffy(controller.viewGroupMessagesModel.date).format('d/M/yyyy h:mm a')}",
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .headline3!
                          .copyWith(
                            fontSize: 15,
                            color: AppColor.greyDark,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "All Media",
                          style: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .headline4!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 270,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: PageView.builder(
                    onPageChanged: (value) {
                      controller.changeValue(value);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.listPhoto.length,
                    itemBuilder: (context, index) =>
                        controller.listPhoto[index].file!.isImageFileName
                            ? Image.network(
                                controller.index == null
                                    ? "${AppLink.groupChatImage}/${controller.viewGroupMessagesModel.file}"
                                    : "${AppLink.groupChatImage}/${controller.listPhoto[controller.index!].file!}",
                                fit: BoxFit.fitWidth,
                                filterQuality: FilterQuality.high,
                                width: MediaQuery.of(context).size.width,
                              )
                            : null),
              ),
              //const Spacer(),
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  height: 100,
                  child: Column(
                    children: [
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listPhoto.length,
                          itemBuilder: (context, index) {
                            return controller
                                    .listPhoto[index].file!.isImageFileName
                                ? Container(
                                    margin: const EdgeInsets.only(top: 2),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: InkWell(
                                      onTap: () {
                                        controller.changeValue(index);
                                      },
                                      child: Image.network(
                                        "${AppLink.groupChatImage}/${controller.listPhoto[index].file}",
                                      ),
                                    ),
                                  )
                                : null;
                          },
                        ),
                      ),

                      // Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.cloud_upload_outlined,
                                color: Colors.blue.shade900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.rebase_edit,
                                color: Colors.blue.shade900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border_outlined,
                                color: Colors.blue.shade900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_rounded,
                                color: Colors.blue.shade900),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
