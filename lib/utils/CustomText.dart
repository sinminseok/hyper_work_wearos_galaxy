import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Body1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Body1", fontWeight: FontWeight.w500),);
}

Widget Body2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 13.sp, fontFamily:  "Body2", fontWeight: FontWeight.w500),);
}

Widget LargeTitleText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 40.sp, fontFamily: "LargeTitle" , fontWeight: FontWeight.w900),);
}

Widget PercentageText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 18.sp, fontFamily: "Percentage", fontWeight: FontWeight.w900),);
}

Widget PretandardText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 18.sp, fontFamily: "Pretandard", fontWeight: FontWeight.w500),);
}
Widget ScoreText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 55.sp , fontFamily: "Title2", fontWeight: FontWeight.w600),);
}



Widget Title1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 23.sp , fontFamily: "Title2", fontWeight: FontWeight.w600),);
}

Widget Title2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 19.sp, fontFamily: "Title2", fontWeight: FontWeight.w800),);
}

Widget Title3Text(String text, Color color){
  return Text("${text}",overflow: TextOverflow.ellipsis, style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Title3", fontWeight: FontWeight.w600),);
}

Widget SubTitle1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp , fontFamily: "SubTitle2", fontWeight: FontWeight.w500),);
}

Widget SubTitle2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp, fontFamily: "SubTitle2", fontWeight: FontWeight.w400),);
}

Widget SubTitle3Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 12.sp, fontFamily: "SubTitle2", fontWeight: FontWeight.w500),);
}
Widget SubTitle4Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 10.sp, fontFamily: "SubTitle2", fontWeight: FontWeight.w500),);
}

Widget HintText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp, fontFamily: "Hint", fontWeight: FontWeight.w500),);
}

Widget Hint2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Hint", fontWeight: FontWeight.w500),);
}

Widget ChipText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Chip", fontWeight: FontWeight.w500),);
}

Widget ButtonText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp , fontFamily: "Helper", fontWeight: FontWeight.w500),);
}

Widget Button2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp , fontFamily: "Helper", fontWeight: FontWeight.w800),);
}

Widget HelperText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 12.sp , fontFamily: "Helper", fontWeight: FontWeight.w400),);
}

Widget HelperBolderText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp , fontFamily: "Helper2", fontWeight: FontWeight.w700),);
}

Widget Helper2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp , fontFamily: "Helper2", fontWeight: FontWeight.w500),);
}

Widget ContentText(String text, Color color){
  return Text("${text}", style: TextStyle(height: 1.9.h, color : color, fontSize: 14.sp , fontFamily: "Helper2", fontWeight: FontWeight.w500),);
}