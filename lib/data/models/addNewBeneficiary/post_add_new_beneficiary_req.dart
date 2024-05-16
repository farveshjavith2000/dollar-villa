class PostAddNewBeneficiaryReq {
  String? senderNumber;
  String? userId;
  String? senderName;
  String? accno;
  String? ifsc;
  String? bankCode;
  String? channelsSupported;
  String? accVerAvailabe;
  String? ifscStatus;
  String? beneName;
  String? beneMobile;
  String? bankName;

  PostAddNewBeneficiaryReq(
      {this.senderNumber,
      this.userId,
      this.senderName,
      this.accno,
      this.ifsc,
      this.bankCode,
      this.channelsSupported,
      this.accVerAvailabe,
      this.ifscStatus,
      this.beneName,
      this.beneMobile,
      this.bankName});

  PostAddNewBeneficiaryReq.fromJson(Map<String, dynamic> json) {
    senderNumber = json['SenderNumber'];
    userId = json['UserId'];
    senderName = json['SenderName'];
    accno = json['accno'];
    ifsc = json['IFSC'];
    bankCode = json['bankCode'];
    channelsSupported = json['channelsSupported'];
    accVerAvailabe = json['accVerAvailabe'];
    ifscStatus = json['ifscStatus'];
    beneName = json['BeneName'];
    beneMobile = json['BeneMobile'];
    bankName = json['BankName'];
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
    if (accno != null) {
      data['accno'] = accno;
    }
    if (ifsc != null) {
      data['IFSC'] = ifsc;
    }
    if (bankCode != null) {
      data['bankCode'] = bankCode;
    }
    if (channelsSupported != null) {
      data['channelsSupported'] = channelsSupported;
    }
    if (accVerAvailabe != null) {
      data['accVerAvailabe'] = accVerAvailabe;
    }
    if (ifscStatus != null) {
      data['ifscStatus'] = ifscStatus;
    }
    if (beneName != null) {
      data['BeneName'] = beneName;
    }
    if (beneMobile != null) {
      data['BeneMobile'] = beneMobile;
    }
    if (bankName != null) {
      data['BankName'] = bankName;
    }
    return data;
  }
}
