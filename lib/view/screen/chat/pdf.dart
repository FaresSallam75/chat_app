import 'dart:io';
import 'package:chat_app/controller/chat/pdf_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class PDFViewerPages extends StatelessWidget {
  final File file;
  const PDFViewerPages({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    // ChatWithUsersController controller = Get.find();
    // final name = basename(file.path);
    // final text = '${controller.indexPage + 1} of ${controller.pages}';

    return GetBuilder<PDFController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.blueDark,
                title: Text(
                  basename(file.path),
                  style: Theme.of(context)
                      .appBarTheme
                      .titleTextStyle!
                      .copyWith(fontSize: 18),
                ),
                actions: controller.pages >= 2
                    ? [
                        Center(
                            child: Text(
                                "${controller.indexPage + 1} of ${controller.pages}")),
                        IconButton(
                          icon: const Icon(Icons.chevron_left, size: 32),
                          onPressed: () {
                            final page = controller.indexPage == 0
                                ? controller.pages
                                : controller.indexPage - 1;
                            controller.pdfViewController.setPage(page);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, size: 32),
                          onPressed: () {
                            final page =
                                controller.indexPage == controller.pages - 1
                                    ? 0
                                    : controller.indexPage + 1;
                            controller.pdfViewController.setPage(page);
                          },
                        ),
                      ]
                    : null,
              ),
              body: PDFView(
                  filePath: file.path,
                  // autoSpacing: false,
                  // swipeHorizontal: true,
                  // pageSnap: false,
                  // pageFling: false,
                  onRender: (pages) {
                    controller.pages = pages!;
                    controller.update();
                  },
                  onViewCreated: (contro) {
                    controller.pdfViewController = contro;
                    controller.update();
                  },
                  onPageChanged: (indexPage, _) {
                    controller.indexPage = indexPage!;
                    controller.update();
                  }),
            ));
  }
}
