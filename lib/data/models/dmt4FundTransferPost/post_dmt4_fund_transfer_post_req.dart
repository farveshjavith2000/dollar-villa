class PostDmt4FundTransferPostReq {
  String? mobileNumber;
  String? userId;
  String? name;
  String? recipientMobile;
  String? account;
  String? bname;
  String? transmode;
  String? amount;
  String? ifsc;
  String? beneName;
  String? recipientId;
  String? moveType;
  String? memberId;

  PostDmt4FundTransferPostReq(
      {this.mobileNumber,
      this.userId,
      this.name,
      this.recipientMobile,
      this.account,
      this.bname,
      this.transmode,
      this.amount,
      this.ifsc,
      this.beneName,
      this.recipientId,
      this.moveType,
      this.memberId});

  PostDmt4FundTransferPostReq.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    userId = json['UserId'];
    name = json['name'];
    recipientMobile = json['recipient_mobile'];
    account = json['account'];
    bname = json['bname'];
    transmode = json['transmode'];
    amount = json['amount'];
    ifsc = json['Ifsc'];
    beneName = json['BeneName'];
    recipientId = json['recipient_id'];
    moveType = json['moveType'];
    memberId = json['member_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (mobileNumber != null) {
      data['mobile_number'] = mobileNumber;
    }
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (recipientMobile != null) {
      data['recipient_mobile'] = recipientMobile;
    }
    if (account != null) {
      data['account'] = account;
    }
    if (bname != null) {
      data['bname'] = bname;
    }
    if (transmode != null) {
      data['transmode'] = transmode;
    }
    if (amount != null) {
      data['amount'] = amount;
    }
    if (ifsc != null) {
      data['Ifsc'] = ifsc;
    }
    if (beneName != null) {
      data['BeneName'] = beneName;
    }
    if (recipientId != null) {
      data['recipient_id'] = recipientId;
    }
    if (moveType != null) {
      data['moveType'] = moveType;
    }
    if (memberId != null) {
      data['member_id'] = memberId;
    }
    return data;
  }
}
