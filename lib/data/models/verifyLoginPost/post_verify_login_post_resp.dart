import '../../../core/utils/pref_utils.dart';

class PostVerifyLoginPostResp {
  String? status;
  String? message;
  String? detail;
  String? mem_id;

  PostVerifyLoginPostResp({this.status, this.message, this.detail,this.mem_id});

  PostVerifyLoginPostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    detail = json['detail'];
    mem_id = json['mem_id'];

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (detail != null) {
      data['detail'] = detail;
    }
    if (mem_id != null) {
      data['mem_id'] = mem_id;
    }
    return data;
  }
}
