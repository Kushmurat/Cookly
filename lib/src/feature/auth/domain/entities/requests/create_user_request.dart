class CreateUserRequest {
  CreateUserRequest({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;
}
