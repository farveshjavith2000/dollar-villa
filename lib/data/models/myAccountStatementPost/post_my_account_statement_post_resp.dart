class PostMyAccountStatementPostResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;
  List<AccsmtList>? accsmtList;

  PostMyAccountStatementPostResp(
      {this.status,
      this.message,
      this.errorMsg,
      this.errorCode,
      this.accsmtList});

  PostMyAccountStatementPostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorMsg = json['errorMsg'];
    errorCode = json['errorCode'];
    if (json['accsmt_list'] != null) {
      accsmtList = <AccsmtList>[];
      json['accsmt_list'].forEach((v) {
        accsmtList?.add(AccsmtList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (accsmtList != null) {
      data['accsmt_list'] = accsmtList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AccsmtList {
  String? product;
  String? dateTime;
  String? description;
  String? type;
  String? amount;
  String? openBal;
  String? closeBal;

  AccsmtList(
      {this.product,
      this.dateTime,
      this.description,
      this.type,
      this.amount,
      this.openBal,
      this.closeBal});

  AccsmtList.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    dateTime = json['date&time'];
    description = json['Description'];
    type = json['Type'];
    amount = json['Amount'];
    openBal = json['open-bal'];
    closeBal = json['close-bal'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product;
    }
    if (dateTime != null) {
      data['date&time'] = dateTime;
    }
    if (description != null) {
      data['Description'] = description;
    }
    if (type != null) {
      data['Type'] = type;
    }
    if (amount != null) {
      data['Amount'] = amount;
    }
    if (openBal != null) {
      data['open-bal'] = openBal;
    }
    if (closeBal != null) {
      data['close-bal'] = closeBal;
    }
    return data;
  }
}
