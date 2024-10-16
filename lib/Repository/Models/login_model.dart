
class LoginModel {
  String? accessToken;
  String? refreshToken;

  LoginModel({this.accessToken, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if(json["access_token"] is String) {
      accessToken = json["access_token"];
    }
    if(json["refresh_token"] is String) {
      refreshToken = json["refresh_token"];
    }
  }

  static List<LoginModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LoginModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["refresh_token"] = refreshToken;
    return _data;
  }

  LoginModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) => LoginModel(
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
  );
}