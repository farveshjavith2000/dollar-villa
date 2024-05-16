class PostDmt4FundTransferPostResp {
  String? status;
  String? errorMsg;
  String? errorCode;
  String? serviceCharge;
  String? msg;

  PostDmt4FundTransferPostResp(
      {this.status, this.errorMsg, this.errorCode, this.serviceCharge,this.msg});

  PostDmt4FundTransferPostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorMsg = json['errorMsg'];
    msg = json['msg'];
    errorCode = json['errorCode'];
    serviceCharge = json['service_charge'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    if (msg != null) {
      data['msg'] = msg;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (serviceCharge != null) {
      data['service_charge'] = serviceCharge;
    }
    return data;
  }
}
