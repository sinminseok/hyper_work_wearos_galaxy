class UserProfileResponse {
  final int id;
  final String name;
  final String brith;
  final String phoneNumber;
  final String? profileUrl;

  UserProfileResponse({
    required this.id,
    required this.name,
    required this.brith,
    required this.phoneNumber,
    required this.profileUrl,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      id: json['id'],
      name: json['name'],
      brith: json['brith'],
      phoneNumber: json['phoneNumber'],
      profileUrl: json['profileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brith': brith,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl,
    };
  }
}
