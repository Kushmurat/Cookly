import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';

class Auth {
  Auth({
    required this.user,
    required this.access,
    required this.refresh,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      user: UserResponse.fromJson(json['user']),
      access: json['access'],
      refresh: json['refresh'],
    );
  }

  final UserResponse user;
  final String refresh;
  final String access;
}
