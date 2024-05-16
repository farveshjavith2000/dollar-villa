class PostDeleteBeneficiaryResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;

  PostDeleteBeneficiaryResp(
      {this.status, this.message, this.errorMsg, this.errorCode});

  PostDeleteBeneficiaryResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorMsg = json['errorMsg'];
    errorCode = json['errorCode'];
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
    return data;
  }
}
