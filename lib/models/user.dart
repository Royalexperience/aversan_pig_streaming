class User {
  final String email;
  final String username;
  final String password;

  User(this.username, this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
      };
}