class PostCreateTpinResp {
  String? status;
  String? message;
  String? sessionOtpid;
  String? otpstatus;
  String? tpin;

  PostCreateTpinResp(
      {this.status,
      this.message,
      this.sessionOtpid,
      this.otpstatus,
      this.tpin});

  PostCreateTpinResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    sessionOtpid = json['session_otpid'];
    otpstatus = json['otpstatus'];
    tpin = json['tpin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (sessionOtpid != null) {
      data['session_otpid'] = sessionOtpid;
    }
    if (otpstatus != null) {
      data['otpstatus'] = otpstatus;
    }
    if (tpin != null) {
      data['tpin'] = tpin;
    }
    return data;
  }
}
