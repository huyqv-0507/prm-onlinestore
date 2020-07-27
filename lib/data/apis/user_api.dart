class UserApi {
  static String login(String username, String password) {
    return 'api/v1/login?username=$username&password=$password';
  }
}
