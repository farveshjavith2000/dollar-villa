import 'dart:convert';
import 'package:dollervilla/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/benificiary/models.dart';
final dio = Dio();
class User {

  var status;
  var message;
  var session_otpid;
  var otpstatus;
  var mem_id;
  var connectionerror="";
  List bankdata = [];
  Future<List<BenificiaryModel>> getData(filter) async {
    var urlpharse='';
    if(PrefUtils().getDMTName()==""){
      urlpharse='GetDMT1BankList';
    }
    if(PrefUtils().getDMTName()=="Paysdmt"){
      urlpharse='PaysGetBankList';
    }

    var headers = {
      'Content-Type': 'application/json',
    };
    var dio = Dio();
    var response = await dio.request(
      ApiClient().url + '/$urlpharse',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      // Constants.printMsg(json.encode(response.data));
      var result = json.decode(response.toString());
      bankdata=result['banksList'];

      final data = bankdata;//response.data['banksList'];
      if (data != true) {
        return BenificiaryModel.fromJsonList(data);
      }

    }
    else {
      print(response.statusMessage);
    }
    return [];
  }



}

class Data {

  final String? bene_id;
  final String? bankid;
  final String? bankname;
  final String? name;
  final String? accno;
  final String? ifsc;
  Data({required this.bene_id, required this.bankid, required this.bankname, required this.name, required this.accno, required this.ifsc});
  factory Data.fromJson(Map<String, dynamic> json,mode) {
    return Data(
      bene_id: (mode=='dmt1')?json['recipientId']:json['bene_id'],
      bankid:(mode=='dmt1')?json['recipientId']:json['bene_id'],
      bankname: (mode=='dmt1')?json['bankName']:json['bankname'],
      name:(mode=='dmt1')?json['recipientName']:json['name'],
      accno: (mode=='dmt1')?json['udf1']:json['accno'],
      ifsc: (mode=='dmt1')?json['udf2']:json['ifsc'],
    );
  }
}

