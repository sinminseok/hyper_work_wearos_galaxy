

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:run_wearos/game/participated-game/view/CancelGameView.dart';
import 'package:run_wearos/utils/Colors.dart';

import '../../../utils/CustomText.dart';

class ParticipatedGameView extends StatelessWidget {
  const ParticipatedGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextBlackColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              _buildBody(),
              // 여기다가 만들고 싶은 버튼은 Stack의 children 마지막에 넣어줄게
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(300.h),
                  topRight: Radius.circular(300.h),
                ),
                child: InkWell(
                  onTap: (){
                    Get.to(() =>  CancelGameView());
                  },
                  child: Container(
                    width: 300.w,  // ← 원하는 만큼 조절
                    height: 70.w,
                    color: kRedColor,
                    child: Center(
                        child: Title1Text("참가 철회", kWhiteColor)
                    ),
                  ),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }

  Widget _buildBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 00.w),
            child: ScoreText("15:00:00", kWhiteColor)
        ),
        Container(
            margin: EdgeInsets.only(top: 10.w),
            child: Title2Text("경기 시작까지 남은 시간", kWhiteColor)
        ),
      ],
    );
  }

  Widget _buildHeader(){
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
                    child: Image.asset("assets/icons/fire_icon.png",color: kPrimaryColor,),

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
      ],
    );
  }
}
