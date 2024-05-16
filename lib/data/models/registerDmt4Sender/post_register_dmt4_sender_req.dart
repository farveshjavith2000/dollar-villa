class PostRegisterDmt4SenderReq {
  String? senderNumber;
  String? userId;
  String? senderName;
  String? otp;
  String? senderFName;
  String? senderLName;
  String? otpsesid;

  PostRegisterDmt4SenderReq(
      {this.senderNumber,
      this.userId,
      this.senderName,
      this.otp,
      this.senderFName,
      this.senderLName,
      this.otpsesid});

  PostRegisterDmt4SenderReq.fromJson(Map<String, dynamic> json) {
    senderNumber = json['SenderNumber'];
    userId = json['UserId'];
    senderName = json['SenderName'];
    otp = json['OTP'];
    senderFName = json['SenderFName'];
    senderLName = json['SenderLName'];
    otpsesid = json['Otpsesid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (senderNumber != null) {
      data['SenderNumber'] = senderNumber;
    }
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (senderName != null) {
      data['SenderName'] = senderName;
    }
    if (otp != null) {
      data['OTP'] = otp;
    }
    if (senderFName != null) {
      data['SenderFName'] = senderFName;
    }
    if (senderLName != null) {
      data['SenderLName'] = senderLName;
    }
    if (otpsesid != null) {
      data['Otpsesid'] = otpsesid;
    }
    return data;
  }
}
