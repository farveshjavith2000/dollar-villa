class PostDeleteBeneficiaryReq {
  String? mobile;
  String? userId;
  String? senderName;
  String? beneficiaryID;

  PostDeleteBeneficiaryReq(
      {this.mobile, this.userId, this.senderName, this.beneficiaryID});

  PostDeleteBeneficiaryReq.fromJson(Map<String, dynamic> json) {
    mobile = json['Mobile'];
    userId = json['UserId'];
    senderName = json['SenderName'];
    beneficiaryID = json['BeneficiaryID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (mobile != null) {
      data['Mobile'] = mobile;
    }
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (senderName != null) {
      data['SenderName'] = senderName;
    }
    if (beneficiaryID != null) {
      data['BeneficiaryID'] = beneficiaryID;
    }
    return data;
  }
}
