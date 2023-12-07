import 'package:chat_app/controller/call_page/callpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CallPageController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<CallPageController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Edit",
                      style:
                          // ignore: deprecated_member_use
                          Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade400,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.changeButton(0);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: controller.currentButton == 0
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: const Text(
                                  "All",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.changeButton(1);
                              },
                              child: Container(
                                color: controller.currentButton == 1
                                    ? Colors.white
                                    : Colors.grey,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: const Text("Missed",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add_call,
                      color: Colors.blue.shade900,
                    )
                  ],
                ),
                Divider(thickness: 1, color: Colors.grey.shade400),
                Flexible(
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const Text(
                          "Chats",
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 20,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.grey.shade400,
                              textColor: Colors.white,
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 7),
                                  Text("Search"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              radius: 20,
                              child: const Icon(Icons.link_sharp),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Create Call link",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue.shade900),
                                ),
                                const Text(
                                  "Share a link for your WhatsApp call",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ...List.generate(
                        15,
                        (index) => Container(
                          decoration: const BoxDecoration(
                            // color: Colors.grey.shade300,
                            border: Border.symmetric(
                              horizontal: BorderSide(width: 0.2),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                radius: 22,
                                child: const Icon(Icons.link_sharp),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "David Luiz",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                          size: 15,
                                          color: Colors.grey.shade600),
                                      const SizedBox(width: 3),
                                      Text(
                                        "Missed",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Text(
                                "2/23/2023",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(width: 3),
                              Icon(
                                Icons.info_outlined,
                                color: Colors.blue.shade900,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
