class PostMobileRechargePostReq {
  String? userId;
  String? mobile;
  String? operatorname;
  String? operatorid;
  String? operatortype;
  String? amount;

  PostMobileRechargePostReq(
      {this.userId,
      this.mobile,
      this.operatorname,
      this.operatorid,
      this.operatortype,
      this.amount});

  PostMobileRechargePostReq.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    mobile = json['Mobile'];
    operatorname = json['operatorname'];
    operatorid = json['operatorid'];
    operatortype = json['operatortype'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (mobile != null) {
      data['Mobile'] = mobile;
    }
    if (operatorname != null) {
      data['operatorname'] = operatorname;
    }
    if (operatorid != null) {
      data['operatorid'] = operatorid;
    }
    if (operatortype != null) {
      data['operatortype'] = operatortype;
    }
    if (amount != null) {
      data['amount'] = amount;
    }
    return data;
  }
}
