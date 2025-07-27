enum GameType {
  SPEED,
  HEARTBEAT,
  CADENCE,
  FLIGHT_TIME,
  VERTICAL_OSCILLATION,
  POWER,
  GROUND_CONTACT_TIME
}

extension GameTypeExtension on GameType {
  String get koreanName {
    switch (this) {
      case GameType.SPEED:
        return "스피드";
      case GameType.HEARTBEAT:
        return "심박수";
      case GameType.CADENCE:
        return "케이던스";
      case GameType.FLIGHT_TIME:
        return "체공시간";
      case GameType.VERTICAL_OSCILLATION:
        return "수직진폭";
      case GameType.POWER:
        return "강성";
      case GameType.GROUND_CONTACT_TIME:
        return "지면접촉시간";
    }
  }

  static GameType fromString(String value) {
    return GameType.values.firstWhere(
          (e) => e.toString().split('.').last == value,
      orElse: () => GameType.SPEED, // 기본값 설정
    );
  }
}