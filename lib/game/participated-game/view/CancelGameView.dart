import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:run_wearos/game/participated-game/view/CancelGameSuccessView.dart';
import 'package:run_wearos/utils/Colors.dart';

import '../../../utils/CustomText.dart';

class CancelGameView extends StatelessWidget {
  const CancelGameView({super.key});

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
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(

      margin: EdgeInsets.only(top: 20.w),
      width: 278.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            onTap: () {},
            child: Container(
              width: 130.w,
              height: 54.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(37)),
                  color: Color(0xffEAECF1)),
              child: Center(
                child: ButtonText("취소", kGrey700Color),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => CancelGameSuccessView());
            },
            child: Container(
              width: 130.w,
              height: 54.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(37)),
                  color: kRedColor),
              child: Center(
                child: ButtonText("참가철회", kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 49.h),
          child: Center(
            child: Container(child: Title1Text("“스피드 - 5km”", kWhiteColor)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Center(
            child: Container(child: Title2Text("참가를 철회하시겠습니까", kWhiteColor)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Container(child: Title2Text("참가권", kWhiteColor)),
                ),
              ),
              Container(
                child: Center(
                  child: Container(child: Title2Text("1장", kMintColor)),
                ),
              ),
              Container(
                child: Center(
                  child: Container(child: Title2Text("이 회수 됩니다.", kWhiteColor)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
