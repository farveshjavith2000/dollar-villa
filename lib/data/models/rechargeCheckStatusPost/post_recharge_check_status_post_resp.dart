class PostRechargeCheckStatusPostResp {
  String? status;
  String? message;
  String? errorCode;
  String? transID;
  String? mobile;
  String? type;
  String? transAmount;
  String? productName;
  String? createdOn;
  String? RequestID;
  String? ServiceProvider;

  PostRechargeCheckStatusPostResp(
      {this.status,
      this.message,
      this.errorCode,
      this.transID,
      this.RequestID,
      this.ServiceProvider,
      this.mobile,
      this.type,
      this.transAmount,
      this.productName,
      this.createdOn});

  PostRechargeCheckStatusPostResp.fromJson(Map<String, dynamic> json) {
    status = json['message'];
    message = json['message'];
    errorCode = json['errorCode'];
    transID = json['TransID'];
    RequestID = json['RequestId'];
    ServiceProvider = json['ProductName'];
    mobile = json['Mobile'];
    type = json['Type'];
    transAmount = json['TransAmount'];
    productName = json['ProductName'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (transID != null) {
      data['TransID'] = transID;
    }
    if (RequestID != null) {
      data['RequestID'] = RequestID;
    }
    if (ServiceProvider != null) {
      data['ServiceProvider'] = ServiceProvider;
    }
    if (mobile != null) {
      data['Mobile'] = mobile;
    }
    if (type != null) {
      data['Type'] = type;
    }
    if (transAmount != null) {
      data['TransAmount'] = transAmount;
    }
    if (productName != null) {
      data['ProductName'] = productName;
    }
    if (createdOn != null) {
      data['created_on'] = createdOn;
    }

    return data;
  }
}
