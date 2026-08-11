class AuthLoginResponseModel {
  final AuthDataModel? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  AuthLoginResponseModel({this.data, this.message, this.error, this.status});

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginResponseModel(
      data: json['data'] != null ? AuthDataModel.fromJson(json['data']) : null,
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}

class AuthDataModel {
  final UserModel? user;
  final String? token;

  AuthDataModel({this.user, this.token});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return AuthDataModel(
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      token: json['token'] as String?,
    );
  }
}

class UserModel {
  final int? id;
  final String? name;
  final String? email;

  UserModel({this.id, this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );
  }
}

class AuthLoginRequestModel {
  final String email;
  final String password;

  AuthLoginRequestModel({required this.email, required this.password});
}
