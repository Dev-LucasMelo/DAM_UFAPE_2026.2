class ProfileModel {
  ProfileModel({
    required this.username,
    required this.email,
    required this.password,
  });

  String username;
  String email;
  String password;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
