import 'dart:convert';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/data/models/benificiary/operatormodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/benificiary/models.dart';

final dio = Dio();

class Operator {
  var status;
  var message;
  var session_otpid;
  var otpstatus;
  var mem_id;
  var connectionerror = "";
  List bankdata = [];

  Future<List<OperatorModel>> getData(filter) async {
    var urlpharse = 'Rechargeoperatorlist';

    var type = "";
print("Get PAGE");
print(PrefUtils().getPage());
    if (PrefUtils().getPage() == "lbl_mobile_postpaid") {
      print("dsfsfdsfds");
      print(PrefUtils().getMobileRerchargetype());
      if(PrefUtils().getMobileRerchargetype()=="Prepaid"){
        type = "MOBILE";
      }else{
        type = "PostPaid";
      }

    }
    if (PrefUtils().getPage() == "lbl_bbps_payment") {

      urlpharse = 'BBPSShowBillCat';
    }


    if (PrefUtils().getPage() == "lbl_dth_recharge") {
      type = "DTH";
    }
    if (PrefUtils().getPage() == "msg_landline_bill_payment") {
      type = "Landline";
    }

    if (PrefUtils().getPage() == "msg_broadband_bill_payment") {
      type = "Landline";
    }
mem_id=PrefUtils().getMemIdForUserLoggedIn();
    var data = json.encode({"Type": "$type", "operatorid": "1"});
    if (PrefUtils().getPage() == "lbl_bbps_payment") {
      data = json.encode(
          {
            "UserId":"$mem_id",
            "bilCatName":"ELECTRICITY"
          }
         // {"Type": "$type", "operatorid": "1"}
      );

    }

    //urlpharse='Rechargeoperatorlist';

    var headers = {
      'Content-Type': 'application/json',
    };
    var dio = Dio();
    var response;
    print(data);
    print(ApiClient().url + '/$urlpharse');
    response = await dio.request(
      ApiClient().url + '/$urlpharse',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.toString());

      if (PrefUtils().getPage() == "lbl_bbps_payment") {

        bankdata = result['billerlist'];
      }else{
        bankdata = result['operList'];
      }
      final data = bankdata;
      print(data);
      if (data != true) {
        return OperatorModel.fromJsonList(data);
      }
    } else {
      print(response.statusMessage);
    }
    return [];
  }
}
/*
class Data {
  final String? bene_id;
  final String? bankid;
  final String? bankname;
  final String? name;
  final String? accno;
  final String? ifsc;

  Data(
      {required this.bene_id,
      required this.bankid,
      required this.bankname,
      required this.name,
      required this.accno,
      required this.ifsc});

  factory Data.fromJson(Map<String, dynamic> json, mode) {
    return Data(
      bene_id: (mode == 'dmt1') ? json['recipientId'] : json['bene_id'],
      bankid: (mode == 'dmt1') ? json['recipientId'] : json['bene_id'],
      bankname: (mode == 'dmt1') ? json['bankName'] : json['bankname'],
      name: (mode == 'dmt1') ? json['recipientName'] : json['name'],
      accno: (mode == 'dmt1') ? json['udf1'] : json['accno'],
      ifsc: (mode == 'dmt1') ? json['udf2'] : json['ifsc'],
    );
  }
}*/
