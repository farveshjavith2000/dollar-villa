class PostRegisterDmt4SenderResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;
  int? refcode;

  PostRegisterDmt4SenderResp(
      {this.status, this.message, this.errorMsg, this.errorCode, this.refcode});

  PostRegisterDmt4SenderResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorMsg = json['errorMsg'];
    errorCode = json['errorCode'];
    refcode = json['refcode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (refcode != null) {
      data['refcode'] = refcode;
    }
    return data;
  }
}
