class PostVerifyLoginPostReq {
  String? username;
  String? password;
  String? otp;
  String? sessionOtpid;

  PostVerifyLoginPostReq(
      {this.username, this.password, this.otp, this.sessionOtpid});

  PostVerifyLoginPostReq.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
    otp = json['Otp'];
    sessionOtpid = json['session_otpid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['Username'] = username;
    }
    if (password != null) {
      data['Password'] = password;
    }
    if (otp != null) {
      data['Otp'] = otp;
    }
    if (sessionOtpid != null) {
      data['session_otpid'] = sessionOtpid;
    }
    return data;
  }
}
