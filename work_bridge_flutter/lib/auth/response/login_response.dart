class LoginResponse {
  final String? token;
  final String tokenType;
  final int? userId;
  final String? email;
  final String? role;
  final int? profileId;
  final String? displayName;
  final String? image;

  const LoginResponse({
    this.token,
    this.tokenType = 'Bearer',
    this.userId,
    this.email,
    this.role,
    this.profileId,
    this.displayName,
    this.image,
  });

  /// Factory constructor to create a [LoginResponse] instance from a JSON map.
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String? ?? 'Bearer',
      userId: (json['userId'] as num?)?.toInt(),
      email: json['email'] as String?,
      role: json['role'] as String?,
      profileId: (json['profileId'] as num?)?.toInt(),
      displayName: json['displayName'] as String?,
      image: json['image'] as String?,
    );
  }

  /// Converts this [LoginResponse] instance into a JSON-compatible map.
  Map<String, dynamic> toJson() {
    return {
      if (token != null) 'token': token,
      'tokenType': tokenType,
      if (userId != null) 'userId': userId,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (profileId != null) 'profileId': profileId,
      if (displayName != null) 'displayName': displayName,
      if (image != null) 'image': image,
    };
  }

  /// Helper method to create a modified copy of this object.
  LoginResponse copyWith({
    String? token,
    String? tokenType,
    int? userId,
    String? email,
    String? role,
    int? profileId,
    String? displayName,
    String? image,
  }) {
    return LoginResponse(
      token: token ?? this.token,
      tokenType: tokenType ?? this.tokenType,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      role: role ?? this.role,
      profileId: profileId ?? this.profileId,
      displayName: displayName ?? this.displayName,
      image: image ?? this.image,
    );
  }
}