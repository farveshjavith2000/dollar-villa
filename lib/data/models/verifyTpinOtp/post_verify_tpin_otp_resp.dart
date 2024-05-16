class PostVerifyTpinOtpResp {
  String? status;
  String? message;
  String? oTPStatus;
  String? oTPDetail;
  String? detail;

  PostVerifyTpinOtpResp(
      {this.status, this.message, this.oTPStatus, this.oTPDetail, this.detail});

  PostVerifyTpinOtpResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    oTPStatus = json['OTP status'];
    oTPDetail = json['OTP Detail'];
    detail = json['Detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (oTPStatus != null) {
      data['OTP status'] = oTPStatus;
    }
    if (oTPDetail != null) {
      data['OTP Detail'] = oTPDetail;
    }
    if (detail != null) {
      data['Detail'] = detail;
    }
    return data;
  }
}
