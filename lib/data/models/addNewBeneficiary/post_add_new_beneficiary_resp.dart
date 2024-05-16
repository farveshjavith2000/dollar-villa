import 'package:dollervilla/core/app_export.dart';

class PostAddNewBeneficiaryResp {
  String? status;
  String? errorMsg;
  String? errorCode;
  String? beneId;
  String? message;

  PostAddNewBeneficiaryResp(
      {this.status, this.errorMsg, this.errorCode, this.beneId});

  PostAddNewBeneficiaryResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorMsg = json['errorMsg'];

    errorMsg =(PrefUtils().getDMTName()=='Paysdmt')?json['errorMsg']:json['message'];
    errorCode = json['errorCode'];
    //beneId = json['bene_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (errorMsg != null) {
      data['errorMsg'] = errorMsg;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    if (beneId != null) {
      data['bene_id'] = beneId;
    }
    return data;
  }
}
