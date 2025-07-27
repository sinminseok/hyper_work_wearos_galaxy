

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:run_wearos/game/in-progress-game/view/InProgressGameView.dart';
import 'package:run_wearos/model/game/response/GameHistoryResponse.dart';
import 'package:run_wearos/utils/CustomParser.dart';

import '../../../utils/Colors.dart';
import '../../../utils/CustomText.dart';

Widget InProgressGameWidget(GameHistoryResponse game){
  return InkWell(
    onTap: (){
      Get.to(() => InProgressGameView(game));
    },
    child: Center(
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        width: 392.w,
        height: 112.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF2A2B2C), // 왼쪽 색상
              Color(0xFF00694E), // 오른쪽 색상
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(71)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w),
              width: 72.w,
              height: 72.h,
              child: Image.asset("assets/icons/fire_icon.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 18.w),
                  child: HintText("${CustomParser.formatDate(game.gameDate)}",kWhiteColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.w),
                  child: Title1Text("${CustomParser.formatGameName(game.gameType, game.gameDistance)}",kWhiteColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.w),
                  child: HintText("경기가 진행중 입니다.",kMintColor),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}