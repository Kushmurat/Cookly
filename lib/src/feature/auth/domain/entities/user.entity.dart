class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
  });

  final int id;
  final String username;
  final String email;
  final String? avatarUrl;
}
