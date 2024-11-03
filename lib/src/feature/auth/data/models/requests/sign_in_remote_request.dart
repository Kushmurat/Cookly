class SignInRemoteRequest {
  SignInRemoteRequest({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
}
