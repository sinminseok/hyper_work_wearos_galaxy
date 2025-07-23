

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:run_wearos/game/participated-game/view/ParticipatedGameView.dart';

import '../../../utils/Colors.dart';
import '../../../utils/CustomText.dart';

Widget NotStartGameWidget(){
  return InkWell(
    onTap: (){
      Get.to(() => ParticipatedGameView());
    },
    child: Center(
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        width: 382.w,
        height: 112.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF2A2B2C), // 왼쪽 색상
              Color(0xFF8B4500), // 오른쪽 색상
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(71)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 27.w),
              width: 72.w,
              height: 72.h,
              child: Image.asset("assets/icons/fire_icon.png", color: kPrimaryColor,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 18.w),
                  child: HintText("2025.06.04",kWhiteColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.w),
                  child: Title1Text("스피드 - 5km",kWhiteColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.w),
                  child: HintText("참가 신청 완료 · 4일뒤 시작 ",kPrimaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}