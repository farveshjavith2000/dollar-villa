import 'package:dollervilla/core/app_export.dart';

class PostGetRecipientsListResp {
  bool? status;
  int? responseCode;
  List<Data>? data;
  String? message;
  PostGetRecipientsListResp(
      {this.status, this.responseCode, this.data, this.message});

  PostGetRecipientsListResp.fromJson(Map<String, dynamic> json) {
    if(PrefUtils().getDMTName()=="Paysdmt"){
      status = json['status'];
    }else{
      if(json['status']=="0"){
        status = true;
      }else{
        status = false;
      }

    }
    var jsonkeyphrase;
    if(PrefUtils().getDMTName()=="Paysdmt"){
      jsonkeyphrase="data";
    }else{
      jsonkeyphrase="recipientList";
    }
    responseCode = json['response_code'];
    if (json['$jsonkeyphrase'] != null) {
      data = <Data>[];
      json['$jsonkeyphrase'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var jsonkeyphrase;
    if(PrefUtils().getDMTName()=="Paysdmt"){
      jsonkeyphrase="data";
    }else{
      jsonkeyphrase="recipientList";
    }
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (responseCode != null) {
      data['response_code'] = responseCode;
    }
    if (this.data != null) {
      data['$jsonkeyphrase'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}

class Data {
  String? beneId;
  //String? bankid;
  String? bankname;
  String? name;
  String? accno;
  String? ifsc;
 // String? verified;
  //String? banktype;
  //bool? paytm;

  Data(
      {this.beneId,
        //this.bankid,
        this.bankname,
        this.name,
        this.accno,
        this.ifsc,
       // this.verified,
        //this.banktype,
       // this.paytm
      });

  Data.fromJson(Map<String, dynamic> json) {
    beneId = (PrefUtils().getDMTName()=="Paysdmt")?json['bene_id']:json['recipientId'];
    //bankid = json['bankid'];
    //bankname = "SBI";json['bankname'];
    bankname = (PrefUtils().getDMTName()=="Paysdmt")?json['bankname']:json['bankName'];
    name = (PrefUtils().getDMTName()=="Paysdmt")?json['name']:json['recipientName'];
    accno = (PrefUtils().getDMTName()=="Paysdmt")?json['accno']:json['udf1'];
    ifsc = (PrefUtils().getDMTName()=="Paysdmt")?json['ifsc']:json['udf2'];
    //verified = json['verified'];
    //banktype = json['banktype'];
   // paytm = json['paytm'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (beneId != null) {
      data['bene_id'] = beneId;
    }
    // if (bankid != null) {
    //   data['bankid'] = bankid;
    // }
    if (bankname != null) {
      data['bankname'] = bankname;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (accno != null) {
      data['accno'] = accno;
    }
    if (ifsc != null) {
      data['ifsc'] = ifsc;
    }
    // if (verified != null) {
    //   data['verified'] = verified;
    // }
    // if (banktype != null) {
    //   data['banktype'] = banktype;
    // }
    // if (paytm != null) {
    //   data['paytm'] = paytm;
    // }
    return data;
  }
}
