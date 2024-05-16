import '../../../core/constants/constants.dart';

class PostMLoginPostFunctionResp {
  String? status;
  String? message;
  String? sessionOtpid;
  String? otpstatus;

  PostMLoginPostFunctionResp(
      {this.status, this.message, this.sessionOtpid, this.otpstatus});

  PostMLoginPostFunctionResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    sessionOtpid = json['session_otpid'];
    otpstatus = json['otpstatus'];
    print("Status:$status");
    print("sessionOtpid : $sessionOtpid");
    Constants.session_otpid=sessionOtpid.toString();
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
    return data;
  }
}
