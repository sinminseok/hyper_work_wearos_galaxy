import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:run_wearos/game/main/view/GameListView.dart';
import 'package:run_wearos/utils/Colors.dart';

import '../../../utils/CustomText.dart';

class CancelGameSuccessView extends StatelessWidget {
  const CancelGameSuccessView({super.key});

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
      width: 258.w,
      child: InkWell(
        onTap: () {
          Get.offAll(() => GameListView());
        },
        child: Container(
          width: 130.w,
          height: 54.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(37)),
              color: kPrimaryColor),
          child: Center(
            child: ButtonText("확인", kWhiteColor),
          ),
        ),
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
            child: Container(child: Title2Text("경기 참가 철회가", kWhiteColor)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Center(
            child: Container(child: Title2Text("정상적으로 완료되었습니다.", kWhiteColor)),
          ),
        ),
      ],
    );
  }
}
