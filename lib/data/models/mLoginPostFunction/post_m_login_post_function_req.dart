import '../../../core/constants/constants.dart';

class PostMLoginPostFunctionReq {
  String? username;
  String? password;

  PostMLoginPostFunctionReq({this.username, this.password});

  PostMLoginPostFunctionReq.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['Username'] = username;
      Constants.mobile=username.toString();
    }
    if (password != null) {
      data['Password'] = password;
      Constants.password=password.toString();
    }
    return data;
  }
}
