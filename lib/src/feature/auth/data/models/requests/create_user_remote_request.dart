class CreateUserRemoteRequest {
  CreateUserRemoteRequest({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'email': email,
      'password': password,
    };
  }
}
