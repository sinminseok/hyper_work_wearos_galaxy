
import '../model/game/enums/GameDistance.dart';
import '../model/game/enums/GameType.dart';

class CustomParser{

  static String formatGameName(GameType type, GameDistance distance){
    return type.koreanName + " - " + distance.koreanName;
  }

  static String formatDate(DateTime dt) {
    // yyyy. MM. dd 형태 (예: 2023. 07. 16)
    final year = dt.year.toString();
    final month = dt.month.toString().padLeft(2, '0');
    final day = dt.day.toString().padLeft(2, '0');
    return "$year. $month. $day";
  }

  static String formatTime(DateTime dt) {
    // AM/PM + hh:mm 형태 (예: AM 09:05)
    final hour = dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? "PM" : "AM";

    // 12시간제로 변환 (0시는 12시로)
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    return "$period ${hour12.toString().padLeft(2, '0')}:$minute";
  }

  /// 경기 시작까지 남은 시간 (형태: hh:mm:ss)
  static String formatRemainingTime(DateTime startTime) {
    final now = DateTime.now();
    final difference = startTime.difference(now);

    // 이미 시작한 경우는 00:00:00으로 처리
    if (difference.isNegative) {
      return "00:00:00";
    }

    final hours = difference.inHours.toString().padLeft(2, '0');
    final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
    } else {
      return "${twoDigits(minutes)}:${twoDigits(seconds)}";
    }
  }
}