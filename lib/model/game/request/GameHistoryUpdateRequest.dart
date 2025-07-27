class GameHistoryUpdateRequest {
  final int gameId;
  final int userId;
  final double currentBpm;
  final double currentCadence;
  final double currentDistance;
  final double currentFlightTime;
  final double currentGroundContactTime;
  final double currentPower;
  final double currentVerticalOscillation;
  final double currentSpeed;

  GameHistoryUpdateRequest({
    required this.gameId,
    required this.userId,
    required this.currentBpm,
    required this.currentCadence,
    required this.currentDistance,
    required this.currentFlightTime,
    required this.currentGroundContactTime,
    required this.currentPower,
    required this.currentVerticalOscillation,
    required this.currentSpeed,
  });

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'userId': userId,
      'currentBpm': currentBpm,
      'currentCadence': currentCadence,
      'currentDistance': currentDistance,
      'currentFlightTime': currentFlightTime,
      'currentGroundContactTime': currentGroundContactTime,
      'currentPower': currentPower,
      'currentVerticalOscillation': currentVerticalOscillation,
      'currentSpeed': currentSpeed,
    };
  }
}
