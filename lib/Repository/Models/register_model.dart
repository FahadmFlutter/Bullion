
class RegisterModel {
  String? message;

  RegisterModel({this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  static List<RegisterModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RegisterModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    return data;
  }

  RegisterModel copyWith({
    String? message,
  }) => RegisterModel(
    message: message ?? this.message,
  );
}