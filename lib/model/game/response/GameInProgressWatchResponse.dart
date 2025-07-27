

class GameInProgressWatchResponse {
  final int rank;
  final int? targetBpm;
  final int? targetCadence;
  final double currentBpm;
  final double currentCadence;
  final double currentDistance;
  final double currentFlightTime;
  final double currentGroundContactTime;
  final double currentPower;
  final double currentVerticalOscillation;
  final double currentSpeed;

  GameInProgressWatchResponse({
    required this.rank,
    this.targetBpm,
    this.targetCadence,
    required this.currentBpm,
    required this.currentCadence,
    required this.currentDistance,
    required this.currentFlightTime,
    required this.currentGroundContactTime,
    required this.currentPower,
    required this.currentVerticalOscillation,
    required this.currentSpeed,
  });

  factory GameInProgressWatchResponse.fromJson(Map<String, dynamic> json) {
    return GameInProgressWatchResponse(
      rank: json['rank'] as int,
      targetBpm: json['targetBpm'] as int?,
      targetCadence: json['targetCadence'] as int?,
      currentBpm: (json['currentBpm'] as num).toDouble(),
      currentCadence: (json['currentCadence'] as num).toDouble(),
      currentDistance: (json['currentDistance'] as num).toDouble(),
      currentFlightTime: (json['currentFlightTime'] as num).toDouble(),
      currentGroundContactTime: (json['currentGroundContactTime'] as num).toDouble(),
      currentPower: (json['currentPower'] as num).toDouble(),
      currentVerticalOscillation: (json['currentVerticalOscillation'] as num).toDouble(),
      currentSpeed: (json['currentSpeed'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'targetBpm': targetBpm,
      'targetCadence': targetCadence,
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
