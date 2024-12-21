class UserResponse {
  UserResponse({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      avatarUrl: json['avatar_url'],
    );
  }

  final int id;
  final String username;
  final String email;
  final String? avatarUrl;
}
