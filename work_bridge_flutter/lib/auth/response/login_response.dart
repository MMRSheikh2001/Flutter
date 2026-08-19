import 'package:work_bridge_flutter/auth/request/user_request.dart';

class LoginResponse {
  final String? token;
  final String tokenType;
  final int? userId;
  final String? email;
  final UserRole? role;
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
      role: json['role'] as UserRole?,
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

}