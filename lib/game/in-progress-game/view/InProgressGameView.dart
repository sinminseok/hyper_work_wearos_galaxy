
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:run_wearos/game/main/view/GameListView.dart';
import 'package:run_wearos/utils/Colors.dart';
import 'package:run_wearos/utils/CustomText.dart';

class InProgressGameView extends StatelessWidget {
  const InProgressGameView({super.key});

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
                  topLeft: Radius.circular(90.h),
                  topRight: Radius.circular(100.h),
                ),
                child: Container(
                  width: 110.w,  // ← 원하는 만큼 조절
                  height: 37.w,
                  color: kRedColor,
                  child: Center(
                    child: HintText("중도 포기", kWhiteColor)
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
          margin: EdgeInsets.only(top: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreText("2nd", kMintColor),
              Container(
                  margin: EdgeInsets.only(left: 13.w, right: 03.w),
                  child: ScoreText("/", kWhiteColor)),
              Container(
                  margin: EdgeInsets.only(top: 10.h,left: 5.w),
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
              Container(
                child: HintText("00:51:00", kWhiteColor),
              )
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
              Container(
                child: HintText("00:51:00", kRedColor),
              )
            ],
          ),
        )
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
                    child: Image.asset("assets/icons/fire_icon.png",),

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
          onTap: (){

          },
          child: Container(
            width: 143.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: Color(0xff2A2B2C),
              borderRadius: BorderRadius.all(Radius.circular(71)),
              border: Border.all(color: kMintColor)
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                    width: 30.w,
                    height: 30.w,
                  child: Image.asset("assets/icons/refresh_icon.png")
                ),
                Container(
                  margin: EdgeInsets.only(left: 9.w
                  ),
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
