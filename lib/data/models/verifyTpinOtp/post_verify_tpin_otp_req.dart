class PostVerifyTpinOtpReq {
  String? userId;
  String? tpin;
  String? otp;
  String? sessionOtpid;

  PostVerifyTpinOtpReq({this.userId, this.tpin, this.otp, this.sessionOtpid});

  PostVerifyTpinOtpReq.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tpin = json['tpin'];
    otp = json['otp'];
    sessionOtpid = json['session_otpid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['user_id'] = userId;
    }
    if (tpin != null) {
      data['tpin'] = tpin;
    }
    if (otp != null) {
      data['otp'] = otp;
    }
    if (sessionOtpid != null) {
      data['session_otpid'] = sessionOtpid;
    }
    return data;
  }
}
