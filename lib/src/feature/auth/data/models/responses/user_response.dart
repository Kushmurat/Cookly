class UserResponse {
  UserResponse({
    required this.userName,
    required this.email,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userName: json['username'],
      email: json['email'],
    );
  }

  final String userName;
  final String email;
}
