import 'package:dollervilla/core/app_export.dart';

class ReportResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;
  List<AccsmtList>? accsmtList;

  ReportResp(
      {this.status,
      this.message,
      this.errorMsg,
      this.errorCode,
      this.accsmtList});

  ReportResp.fromJson(Map<String, dynamic> json) {
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
  String? ClientRefId;
  String? txnId;
  dynamic utr;
  String? customer;
  String? beneficiary;
  String? account;
  String? amount;
  String? serviceCharge;
  String? paymentStatus;
  String? Type;
  String? RequestID;
  String? BankRefId;

  AccsmtList(
      {this.date,
      this.ClientRefId,
      this.txnId,
      this.utr,
      this.customer,
      this.beneficiary,
      this.account,
      this.amount,
      this.serviceCharge,
      this.Type,
      this.paymentStatus,
      this.RequestID,
        this.BankRefId
      });

  AccsmtList.fromJson(Map<String, dynamic> json) {
    // if(PrefUtils().getDMTName()=="Paysdmt"){
    //   date = json['date&time'];
    // }else{
    date = json['Date'];
    //}
    ClientRefId = json['ClientRefId'];
    txnId = json['TxnId'];
    RequestID = json['RequestID'];
    if (Constants.reportFilterType == 'rechargerpt') {
      ClientRefId = json['TransID'];
      txnId = json['TransID'];
      RequestID = json['RequestID'];
    }

    utr = json['UTR'];
    customer = json['Customer'];
    beneficiary = json['Beneficiary'];
    account = json['Account'];
    amount = json['Amount'];
    serviceCharge = json['Service Charge'];
    paymentStatus = json['Payment Status'];
    Type = json['Type'];
    BankRefId=json['TxnId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (date != null) {
      data['Date'] = date;
    }
    if (ClientRefId != null) {
      data['ClientRefId'] = ClientRefId;
    }
    if (RequestID != null) {
      data['RequestID'] = RequestID;
    }
    if (txnId != null) {
      data['TxnId'] = txnId;
    }
    if (txnId != null) {
      data['BankRefId'] = txnId;
    }


    if (utr != null) {
      data['UTR'] = utr;
    }
    if (customer != null) {
      data['Customer'] = customer;
    }
    if (beneficiary != null) {
      data['Beneficiary'] = beneficiary;
    }
    if (account != null) {
      data['Account'] = account;
    }
    if (amount != null) {
      data['Amount'] = amount;
    }
    if (serviceCharge != null) {
      data['Service Charge'] = serviceCharge;
    }
    if (paymentStatus != null) {
      data['Payment Status'] = paymentStatus;
    }
    if (Type != null) {
      data['Type'] = Type;
    }
    // if (ClientRefId != null) {
    //   data['ClientRefId'] = ClientRefId;
    // }

    return data;
  }
}
