class PostMobileRechargePostResp {
  String? status;
  String? message;
  String? errorCode;
  String? errorMsg;

  PostMobileRechargePostResp(
      {this.status, this.message, this.errorCode, this.errorMsg});

  PostMobileRechargePostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    return data;
  }
}
