
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:run_wearos/game/main/widgets/InProgressGameWidget.dart';
import 'package:run_wearos/game/main/widgets/NotStartGameWidget.dart';
import 'package:run_wearos/main.dart';
import 'package:run_wearos/utils/Colors.dart';

import '../../../utils/CustomText.dart';

class GameListView extends StatelessWidget {
  const GameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextBlackColor,
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.only(top: 23.h, bottom: 5.h),
            child: Title1Text("참여중인 경기", kWhiteColor),
          ),
          InProgressGameWidget(),
          NotStartGameWidget()
          // Container(
          //   height: 235.h,
          //   width: 385.h,
          //   child: ,
          // )
        ],
      ),
    );
  }
}
