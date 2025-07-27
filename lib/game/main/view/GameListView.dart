import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:run_wearos/game/main/controller/GameListViewController.dart';
import 'package:run_wearos/game/main/widgets/InProgressGameWidget.dart';
import 'package:run_wearos/game/main/widgets/NotStartGameWidget.dart';
import 'package:run_wearos/main.dart';
import 'package:run_wearos/utils/Colors.dart';

import '../../../utils/CustomText.dart';

class GameListView extends StatelessWidget {
  GameListViewController _controller = GameListViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kTextBlackColor,
        body: FutureBuilder(
            future: _controller.load(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("에러 발생: ${snapshot.error}"));
              }
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 23.h, bottom: 5.h),
                    child: Title1Text("참여중인 경기", kWhiteColor),
                  ),
                  _controller.games.length == 0?_buildEmpty(): Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Center(
                      child: Container(
                        width: 330.w,
                        height: 270.w, // 이 높이 안에서 스크롤 되도록 설정
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(_controller.games.length, (index) {
                                final game = _controller.games[index];

                                // 현재 시간
                                final now = DateTime.now();

                                final isInProgress = now.isAfter(game.startAt) && now.isBefore(game.endAt);

                                return Container(
                                  margin: EdgeInsets.only(top: 1.h),
                                  child: isInProgress
                                      ? InProgressGameWidget( game) // 전달할 값이 있다면 game 넘겨주기
                                      : NotStartGameWidget(game),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                  // InProgressGameWidget(),
                  // NotStartGameWidget()
                ],
              );
            }));
  }

  Widget _buildEmpty(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        width: 295.w,
        height: 160.w,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff69FFD8)),
            color: Color(0xff2A2B2C),
            borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Center(
          child: HintText("참가중인 경기가 없습니다.", kWhiteColor),
        ),
      ),
    );
  }
}
