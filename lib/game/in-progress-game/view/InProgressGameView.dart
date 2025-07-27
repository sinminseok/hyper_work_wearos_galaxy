import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:run_wearos/game/main/view/GameListView.dart';
import 'package:run_wearos/utils/Colors.dart';
import 'package:run_wearos/utils/CustomParser.dart';
import 'package:run_wearos/utils/CustomText.dart';

import '../../../model/game/response/GameHistoryResponse.dart';
import '../controller/InprogressGameController.dart';

class InProgressGameView extends StatelessWidget {
  GameHistoryResponse gameHistoryResponse;

  InProgressGameView(this.gameHistoryResponse);

  @override
  Widget build(BuildContext context) {
    InProgressGameController _controller = InProgressGameController();

    return Scaffold(
        backgroundColor: kTextBlackColor,
        body: FutureBuilder(
            future: _controller.load(gameHistoryResponse),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("에러 발생: ${snapshot.error}"));
              }
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeader(_controller),
                      _buildBody(_controller),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90.h),
                          topRight: Radius.circular(100.h),
                        ),
                        child: Container(
                          width: 110.w, // ← 원하는 만큼 조절
                          height: 37.w,
                          color: kRedColor,
                          child: Center(child: HintText("중도 포기", kWhiteColor)),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }));
  }

  Widget _buildBody(InProgressGameController _controller) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controller.gameWatchResponse.value?.rank == null
                      ? ScoreText(
                          "${_controller.gameHistoryResponse.value.myRank}nd",
                          kMintColor)
                      : ScoreText(
                          "${_controller.gameWatchResponse.value?.rank}nd",
                          kMintColor),
                  Container(
                      margin: EdgeInsets.only(left: 13.w, right: 03.w),
                      child: ScoreText("/", kWhiteColor)),
                  Container(
                      margin: EdgeInsets.only(top: 10.h, left: 5.w),
                      child: Title1Text("130", kWhiteColor))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w),
              width: 210.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: HintText("경기 진행 시간", kWhiteColor),
                  ),
                  Obx(() => Container(
                    child: HintText(
                      "${CustomParser.formatDuration(_controller.elapsedTime.value)}",
                      kWhiteColor,
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w),
              width: 210.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: HintText("종료 까지 남은 시간", kWhiteColor),
                  ),
                  Obx(() => Container(
                    child: HintText(
                      "${CustomParser.formatDuration(_controller.remainingTime.value)}",
                      kRedColor,
                    ),
                  )),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildHeader(InProgressGameController _controller) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 35.w,
                    height: 35.h,
                    margin: EdgeInsets.only(right: 5.w),
                    child: Image.asset(
                      "assets/icons/fire_icon.png",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w, right: 20.w),
                    child: Title2Text("스피드 -10km", kWhiteColor),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _controller.sendGameUpdate();
          },
          child: Container(
            width: 143.w,
            height: 45.w,
            decoration: BoxDecoration(
                color: Color(0xff2A2B2C),
                borderRadius: BorderRadius.all(Radius.circular(71)),
                border: Border.all(color: kMintColor)),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 16.w),
                    width: 30.w,
                    height: 30.w,
                    child: Image.asset("assets/icons/refresh_icon.png")),
                Container(
                  margin: EdgeInsets.only(left: 9.w),
                  child: HintText("순위 갱신", kWhiteColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
