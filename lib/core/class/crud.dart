import 'dart:convert';
import 'package:path/path.dart';
import 'dart:io';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_interpolation_to_compose_strings
String _basicAuth = 'Basic ' + base64Encode(utf8.encode('fares:fares102030'));
Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(
            "Response Body ===============================>    $responseBody");
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  // Using File
  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("post", Uri.parse(url));
    var length = await file.length(); //length
    var stream =
        http.ByteStream(file.openRead().asBroadcastStream()); //file.openRead()
    var multiPartFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multiPartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
