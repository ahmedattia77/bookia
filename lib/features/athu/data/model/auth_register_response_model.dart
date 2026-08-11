class AuthRegisterResponseModel {
  final RegisterDataModel? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  AuthRegisterResponseModel({this.data, this.message, this.error, this.status});

  factory AuthRegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthRegisterResponseModel(
      data: json['data'] != null
          ? RegisterDataModel.fromJson(json['data'])
          : null,
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}

class RegisterDataModel {
  final RegisteredUserModel? user;
  final String? token;

  RegisterDataModel({this.user, this.token});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      user: json['user'] != null
          ? RegisteredUserModel.fromJson(json['user'])
          : null,
      token: json['token'] as String?,
    );
  }
}

class RegisteredUserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? phone;
  final bool? emailVerified;
  final String? image;

  RegisteredUserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory RegisteredUserModel.fromJson(Map<String, dynamic> json) {
    return RegisteredUserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      emailVerified: json['email_verified'] as bool?,
      image: json['image'] as String?,
    );
  }
}

class AuthRegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? address;
  final String? city;
  final String? phone;

  AuthRegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.address,
    this.city,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      // later on i'll make it required when i design the forms in register screen ui
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (phone != null) 'phone': phone,
    };
  }
}
