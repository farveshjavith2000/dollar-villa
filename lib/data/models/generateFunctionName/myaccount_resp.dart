import 'package:dollervilla/core/app_export.dart';

class MyAccountResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;
  List<AccsmtList>? accsmtList;

  MyAccountResp(
      {this.status,
      this.message,
      this.errorMsg,
      this.errorCode,
      this.accsmtList});

  MyAccountResp.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? Type;
  String? amount;
  String? Description;
  String? openingbalance;
  String? closingbalance;
  String? ClientRefId;
  String? product;

  AccsmtList(
      {this.date,
      this.Type,
      this.amount,
        this.Description,
        this.openingbalance,
        this.closingbalance,
        this.ClientRefId,
        this.product,
      });

  AccsmtList.fromJson(Map<String, dynamic> json) {
    date = json['date&time'];
    Type = json['Type'];
    ClientRefId=json['ClientRefId'];
    amount = json['Amount'];
    Description = json['Description'];
    openingbalance= json['open-bal'];
    closingbalance= json['close-bal'];
    product= json['product'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (date != null) {
      data['Date'] = date;
    }
    if (Type != null) {
      data['Type'] = Type;
    }
    if (amount != null) {
      data['Amount'] = amount;
    }
    if (Description != null) {
      data['Description'] = Description;
    }
    if (openingbalance != null) {
      data['openingbalance'] = openingbalance;
    }
    if (closingbalance != null) {
      data['closingbalance'] = closingbalance;
    }

    if (ClientRefId != null) {
      data['ClientRefId'] = ClientRefId;
    }

    if (product != null) {
      data['product'] = product;
    }

    return data;
  }
}
