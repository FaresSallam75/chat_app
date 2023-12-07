import 'package:chat_app/core/functions/statusreques.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
