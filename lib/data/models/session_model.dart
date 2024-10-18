class Session {
  final String userId;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final String tokenType;

  Session({
    required this.userId,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      userId: json['user_id'],
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'access_token': accessToken,
      'expires_in': expiresIn,
      'refresh_token': refreshToken,
      'token_type': tokenType,
    };
  }
}
