import 'package:chat_app/core/class/imageasset.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              (AppImageAsset.loading),
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(
                  (AppImageAsset.offline),
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                      (AppImageAsset.server),
                      width: 250,
                      height: 250,
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                          (AppImageAsset.noData),
                          width: 250,
                          height: 250,
                        ),
                      )
                    : widget;
  }
}

class HandlingDataReques extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataReques(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              (AppImageAsset.loading),
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(
                  (AppImageAsset.offline),
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                      (AppImageAsset.server),
                      width: 250,
                      height: 250,
                    ),
                  )
                : widget;
  }
}
