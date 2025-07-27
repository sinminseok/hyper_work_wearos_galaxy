enum GameDistance {
  FIVE_KM_COURSE, TEN_KM_COURSE, HALF_COURSE, FULL_COURSE
}

extension GameDistanceExtension on GameDistance {
  String get koreanName {
    switch (this) {
      case GameDistance.FIVE_KM_COURSE:
        return "5KM";
      case GameDistance.TEN_KM_COURSE:
        return "10KM";
      case GameDistance.HALF_COURSE:
        return "하프";
      case GameDistance.FULL_COURSE:
        return "풀코스";
    }
  }

  static GameDistance fromString(String value) {
    return GameDistance.values.firstWhere(
          (e) => e.toString().split('.').last == value,
      orElse: () => GameDistance.FIVE_KM_COURSE, // 기본값
    );
  }
}
