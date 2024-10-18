class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isEmailVerified;
  final String phoneNumber;
  final bool isPhoneNumberVerified;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isEmailVerified,
    required this.phoneNumber,
    required this.isPhoneNumberVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      isEmailVerified: json["is_email_verified"],
      phoneNumber: json["phone_number"],
      isPhoneNumberVerified: json["is_phone_number_verified"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "is_email_verified": isEmailVerified,
      "phone_number": phoneNumber,
      "is_phone_number_verified": isPhoneNumberVerified,
    };
  }
}
