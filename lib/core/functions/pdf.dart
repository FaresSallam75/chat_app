/* import 'dart:io';
import 'package:chat_app/view/screen/chat/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

late PDFViewController pdfViewController;
int pages = 0;
int indexPage = 0;

Future<File> _storeFile(String url, List<int> bytes) async {
  final filename = basename(url);
  final dir = await getApplicationDocumentsDirectory();

  final file = File('${dir.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
  return file;
}

Future<File> loadNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  return _storeFile(url, bytes);
}

void openPDF(BuildContext context, String file) {
  Get.to(() => PDFViewerPages(file: File(file)));
}
 */