import 'package:dollervilla/core/app_export.dart';

class PostSendVerificationRequestResp {
  String? status;
  String? message;
  String? errorMsg;
  String? errorCode;
  String? stateresp;
  String? sendername;
  String? walletbal;
  String? msg;

  PostSendVerificationRequestResp({
    this.status,
    this.message,
    this.errorMsg,
    this.errorCode,
    this.stateresp,
    this.sendername,
    this.walletbal,
    this.msg,
  });

  PostSendVerificationRequestResp.fromJson(Map<String, dynamic> json) {
    print("PostSendVerificationRequestResp $json");
    status = json['status'];
    if(PrefUtils().getDMTName()=="Paysdmt") {
      message = json['message'];
      errorMsg = json['errorMsg'];
    }else{
      message = json['message'];
      errorMsg = json['errorMsg'];
    }


    errorCode = json['errorCode'];
    stateresp = json['stateresp'];
    if(PrefUtils().getDMTName()=="Paysdmt"){
      sendername = json['sendername'];
    }else{
      sendername = json['name'];
    }
    if(PrefUtils().getDMTName()=="Paysdmt"){
      walletbal = json['remaininglimit'].toString();
    }else{
      walletbal = json['remaininglimit'].toString();
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
    if (msg != null) {
      data['msg'] = msg;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (stateresp != null) {
      data['stateresp'] = stateresp;
    }
    if (walletbal != null) {
      data['walletbal'] = walletbal;
    }
    if (sendername != null) {
      data['sendername'] = sendername;
    }
    return data;
  }
}
