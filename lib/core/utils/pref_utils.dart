import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setStatus(String value) {
    return _sharedPreferences!.setString('status', value);
  }

  String getStatus() {
    try {
      return _sharedPreferences!.getString('status') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMessage(String value) {
    return _sharedPreferences!.setString('message', value);
  }

  String getMessage() {
    try {
      return _sharedPreferences!.getString('message') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDetail(String value) {
    return _sharedPreferences!.setString('detail', value);
  }

  String getDetail() {
    try {
      return _sharedPreferences!.getString('detail') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSessionotpid(String value) {
    return _sharedPreferences!.setString('sessionotpid', value);
  }

  String getSessionotpid() {
    try {
      return _sharedPreferences!.getString('sessionotpid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setOtpstatus(String value) {
    return _sharedPreferences!.setString('otpstatus', value);
  }

  String getOtpstatus() {
    try {
      return _sharedPreferences!.getString('otpstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setBenIdForDelete(String value) {
    return _sharedPreferences!.setString('recipientId', value);
  }

  String getBenIdForDelete() {
    try {
      return _sharedPreferences!.getString('recipientId') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMemIdForUserLoggedIn(String value) {
    return _sharedPreferences!.setString('memId', value);
  }

  String getMemIdForUserLoggedIn() {
    try {
      return _sharedPreferences!.getString('memId') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setStatusverify(String value) {
    return _sharedPreferences!.setString('statusverify', value);
  }

  String getStatusverify() {
    try {
      return _sharedPreferences!.getString('statusverify') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMsgverify(String value) {
    return _sharedPreferences!.setString('msgverify', value);
  }

  String getMsgverify() {
    try {
      return _sharedPreferences!.getString('msgverify') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMsgerrorverify(String value) {
    return _sharedPreferences!.setString('msgerrorverify', value);
  }

  String getMsgerrorverify() {
    try {
      return _sharedPreferences!.getString('msgerrorverify') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setErrorCodeverify(String value) {
    return _sharedPreferences!.setString('errorCodeverify', value);
  }

  String getErrorCodeverify() {
    try {
      return _sharedPreferences!.getString('errorCodeverify') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setErrorstateresp(String value) {
    return _sharedPreferences!.setString('errorstateresp', value);
  }

  String getErrorstateresp() {
    try {
      return _sharedPreferences!.getString('errorstateresp') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRgstatus(String value) {
    return _sharedPreferences!.setString('rgstatus', value);
  }

  String getRgstatus() {
    try {
      return _sharedPreferences!.getString('rgstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRgmessage(String value) {
    return _sharedPreferences!.setString('rgmessage', value);
  }

  String getRgmessage() {
    try {
      return _sharedPreferences!.getString('rgmessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRgerrormsg(String value) {
    return _sharedPreferences!.setString('rgerrormsg', value);
  }

  String getRgerrormsg() {
    try {
      return _sharedPreferences!.getString('rgerrormsg') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRgerrcode(String value) {
    return _sharedPreferences!.setString('rgerrcode', value);
  }

  String getRgerrcode() {
    try {
      return _sharedPreferences!.getString('rgerrcode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRgrefcode(int value) {
    return _sharedPreferences!.setInt('rgrefcode', value);
  }

  int getRgrefcode() {
    try {
      return _sharedPreferences!.getInt('rgrefcode') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setSenderNumber(String value) {
    return _sharedPreferences!.setString('sendernumber', value);
  }

  String getSenderNumber() {
    try {
      return _sharedPreferences!.getString('sendernumber') ?? '';
    } catch (e) {
      return "";
    }
  }

  Future<void> setSenderName(String value) {
    return _sharedPreferences!.setString('sendername', value);
  }

  String getSenderName() {
    try {
      return _sharedPreferences!.getString('sendername') ?? '';
    } catch (e) {
      return "";
    }
  }

  Future<void> setSenderRemainingLimit(String value) {
    return _sharedPreferences!.setString('senderremaininglimit', value);
  }

  String getSenderRemainingLimit() {
    try {
      return _sharedPreferences!.getString('senderremaininglimit') ?? '';
    } catch (e) {
      return "";
    }
  }

  Future<void> setDMTName(String value) {
    return _sharedPreferences!.setString('dmttype', value);
  }

  String getDMTName() {
    try {
      return _sharedPreferences!.getString('dmttype') ?? '';
    } catch (e) {
      return "";
    }
  }

  Future<void> setChangepinstatus(String value) {
    return _sharedPreferences!.setString('changepinstatus', value);
  }

  String getChangepinstatus() {
    try {
      return _sharedPreferences!.getString('changepinstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setChangepinmessage(String value) {
    return _sharedPreferences!.setString('changepinmessage', value);
  }

  String getChangepinmessage() {
    try {
      return _sharedPreferences!.getString('changepinmessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setChangepinotpstatus(String value) {
    return _sharedPreferences!.setString('changepinotpstatus', value);
  }

  String getChangepinotpstatus() {
    try {
      return _sharedPreferences!.getString('changepinotpstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setChangepinotpdetail(String value) {
    return _sharedPreferences!.setString('changepinotpdetail', value);
  }

  String getChangepinotpdetail() {
    try {
      return _sharedPreferences!.getString('changepinotpdetail') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setChangepindetail(String value) {
    return _sharedPreferences!.setString('changepindetail', value);
  }

  String getChangepindetail() {
    try {
      return _sharedPreferences!.getString('changepindetail') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setCreatepinsessionotpid(String value) {
    return _sharedPreferences!.setString('createpinsessionotpid', value);
  }

  String getCreatepinsessionotpid() {
    try {
      return _sharedPreferences!.getString('createpinsessionotpid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setCreatepinsessionotstatus(String value) {
    return _sharedPreferences!.setString('createpinsessionotstatus', value);
  }

  String getCreatepinsessionotstatus() {
    try {
      return _sharedPreferences!.getString('createpinsessionotstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setCreatepintpin(String value) {
    return _sharedPreferences!.setString('createpintpin', value);
  }

  String getCreatepintpin() {
    try {
      return _sharedPreferences!.getString('createpintpin') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setTipcheckstatus(String value) {
    return _sharedPreferences!.setString('tipcheckstatus', value);
  }

  String getTipcheckstatus() {
    try {
      return _sharedPreferences!.getString('tipcheckstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setTipcheckmessage(String value) {
    return _sharedPreferences!.setString('tipcheckmessage', value);
  }

  String getTipcheckmessage() {
    try {
      return _sharedPreferences!.getString('tipcheckmessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setTipcheckdetails(String value) {
    return _sharedPreferences!.setString('tipcheckdetails', value);
  }

  String getTipcheckdetails() {
    try {
      return _sharedPreferences!.getString('tipcheckdetails') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setAddbenstatus(String value) {
    return _sharedPreferences!.setString('addbenstatus', value);
  }

  String getAddbenstatus() {
    try {
      return _sharedPreferences!.getString('addbenstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setAddbenerrorMsg(String value) {
    return _sharedPreferences!.setString('addbenerrorMsg', value);
  }

  String getAddbenerrorMsg() {
    try {
      return _sharedPreferences!.getString('addbenerrorMsg') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setAddbenerrorCode(String value) {
    return _sharedPreferences!.setString('addbenerrorCode', value);
  }

  String getAddbenerrorCode() {
    try {
      return _sharedPreferences!.getString('addbenerrorCode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setAddbenbeneid(String value) {
    return _sharedPreferences!.setString('addbenbeneid', value);
  }

  String getAddbenbeneid() {
    try {
      return _sharedPreferences!.getString('addbenbeneid') ?? '';
    } catch (e) {
      return '';
    }
  }

  // Fund Transfer Data Storage
  Future<void> setFundTranReceipientId(String value) {
    return _sharedPreferences!.setString('TransRecipientId', value);
  }

  String getFundTranReceipientId() {
    try {
      return _sharedPreferences!.getString('TransRecipientId') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranBenName(String value) {
    return _sharedPreferences!.setString('TransBeneName', value);
  }

  String getFundTranBenName() {
    try {
      return _sharedPreferences!.getString('TransBeneName') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranName(String value) {
    return _sharedPreferences!.setString('TransName', value);
  }

  String getFundTranName() {
    try {
      return _sharedPreferences!.getString('TransName') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranAccountNo(String value) {
    return _sharedPreferences!.setString('TransAccNo', value);
  }

  String getFundTranAccountNo() {
    try {
      return _sharedPreferences!.getString('TransAccNo') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranIFSCNo(String value) {
    return _sharedPreferences!.setString('TransIFSCNo', value);
  }

  String getFundTranIFSCNo() {
    try {
      return _sharedPreferences!.getString('TransIFSCNo') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranMode(String value) {
    return _sharedPreferences!.setString('TransMode', value);
  }

  String getFundTranMode() {
    try {
      return _sharedPreferences!.getString('TransMode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFundTranAmount(String value) {
    return _sharedPreferences!.setString('TransAmount', value);
  }

  String getFundTranAmount() {
    try {
      return _sharedPreferences!.getString('TransAmount') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSelectBankId(String value) {
    return _sharedPreferences!.setString('bankid', value);
  }

  String getSelectBankId() {
    try {
      return _sharedPreferences!.getString('bankid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSelectBankName(String value) {
    return _sharedPreferences!.setString('bankname', value);
  }

  String getSelectBankName() {
    try {
      return _sharedPreferences!.getString('bankname') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setTransactionMessage(String value) {
    return _sharedPreferences!.setString('transactionmessage', value);
  }

  String getTransactionMessage() {
    try {
      return _sharedPreferences!.getString('transactionmessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailPrice(String value) {
    return _sharedPreferences!.setString('viewdetailprice', value);
  }

  String getViewDetailPrice() {
    try {
      return _sharedPreferences!.getString('viewdetailprice') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailDescription(String value) {
    return _sharedPreferences!.setString('viewdetaildescription', value);
  }

  String getViewDetailDescription() {
    try {
      return _sharedPreferences!.getString('viewdetaildescription') ?? '';
    } catch (e) {
      return '';
    }
  }


  Future<void> setViewOpeningBalance(String value) {
    return _sharedPreferences!.setString('openingbalance', value);
  }

  String getViewOpeningBalance() {
    try {
      return _sharedPreferences!.getString('openingbalance') ?? '';
    } catch (e) {
      return '';
    }
  }


  Future<void> setViewProduct(String value) {
    return _sharedPreferences!.setString('viewproduct', value);
  }

  String getViewProduct() {
    try {
      return _sharedPreferences!.getString('viewproduct') ?? '';
    } catch (e) {
      return '';
    }
  }


  Future<void> setViewClosingBalance(String value) {
    return _sharedPreferences!.setString('closingbalance', value);
  }

  String getViewClosingBalance() {
    try {
      return _sharedPreferences!.getString('closingbalance') ?? '';
    } catch (e) {
      return '';
    }
  }



  Future<void> setViewDetailStatus(String value) {
    return _sharedPreferences!.setString('viewdetailstatus', value);
  }

  String getViewDetailStatus() {
    try {
      return _sharedPreferences!.getString('viewdetailstatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailMode(String value) {
    return _sharedPreferences!.setString('viewdetailmode', value);
  }

  String getViewDetailMode() {
    try {
      return _sharedPreferences!.getString('viewdetailmode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailRefNo(String value) {
    return _sharedPreferences!.setString('viewdetailrefno', value);
  }

  String getViewDetailRefNo() {
    try {
      return _sharedPreferences!.getString('viewdetailrefno') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailDate(String value) {
    return _sharedPreferences!.setString('viewdetaildate', value);
  }

  String getViewDetailDate() {
    try {
      return _sharedPreferences!.getString('viewdetaildate') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewDetailTime(String value) {
    return _sharedPreferences!.setString('viewdetailtime', value);
  }

  String getViewDetailTime() {
    try {
      return _sharedPreferences!.getString('viewdetailtime') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDeletestatus(String value) {
    return _sharedPreferences!.setString('deletestatus', value);
  }

  String getDeletestatus() {
    try {
      return _sharedPreferences!.getString('deletestatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDeletemessage(String value) {
    return _sharedPreferences!.setString('deletemessage', value);
  }

  String getDeletemessage() {
    try {
      return _sharedPreferences!.getString('deletemessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDeleteerrorMsg(String value) {
    return _sharedPreferences!.setString('deleteerrorMsg', value);
  }

  String getDeleteerrorMsg() {
    try {
      return _sharedPreferences!.getString('deleteerrorMsg') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDeleteerrorCode(String value) {
    return _sharedPreferences!.setString('deleteerrorCode', value);
  }

  String getDeleteerrorCode() {
    try {
      return _sharedPreferences!.getString('deleteerrorCode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFilterFromDate(String value) {
    return _sharedPreferences!.setString('filterfromdate', value);
  }

  String getFilterFromDate() {
    try {
      return _sharedPreferences!.getString('filterfromdate') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFilterToDate(String value) {
    return _sharedPreferences!.setString('filtertodate', value);
  }

  String getFilterToDate() {
    try {
      return _sharedPreferences!.getString('filtertodate') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setWalletBalance(String value) {
    return _sharedPreferences!.setString('walletbalance', value);
  }

  String getWalletBalance() {
    try {
      return _sharedPreferences!.getString('walletbalance') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFilterCustomerMobile(String value) {
    return _sharedPreferences!.setString('filtermobile', value);
  }

  String getFilterCustomerMobile() {
    try {
      return _sharedPreferences!.getString('filtermobile') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFilterCustomerAccNo(String value) {
    return _sharedPreferences!.setString('filteraccno', value);
  }

  String getFilterCustomerAccNo() {
    try {
      return _sharedPreferences!.getString('filteraccno') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFilterCustomerTransactionId(String value) {
    return _sharedPreferences!.setString('filtertid', value);
  }

  String getFilterCustomerTransactionId() {
    try {
      return _sharedPreferences!.getString('filtertid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRechargestatus(String value) {
    return _sharedPreferences!.setString('rechargestatus', value);
  }

  String getRechargestatus() {
    try {
      return _sharedPreferences!.getString('rechargestatus') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRechargemessage(String value) {
    return _sharedPreferences!.setString('rechargemessage', value);
  }

  String getRechargemessage() {
    try {
      return _sharedPreferences!.getString('rechargemessage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRechargeerrorCode(String value) {
    return _sharedPreferences!.setString('rechargeerrorCode', value);
  }

  String getRechargeerrorCode() {
    try {
      return _sharedPreferences!.getString('rechargeerrorCode') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRechargeerrorMsg(String value) {
    return _sharedPreferences!.setString('rechargeerrorMsg', value);
  }

  String getRechargeerrorMsg() {
    try {
      return _sharedPreferences!.getString('rechargeerrorMsg') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setPage(String value) {
    return _sharedPreferences!.setString('currentpage', value);
  }

  String getPage() {
    try {
      return _sharedPreferences!.getString('currentpage') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMobileRerchargetype(String value) {
    return _sharedPreferences!.setString('mobilerechargetype', value);
  }

  String getMobileRerchargetype() {
    try {
      return _sharedPreferences!.getString('mobilerechargetype') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSelectOperatorId(String value) {
    return _sharedPreferences!.setString('operatorid', value);
  }

  String getSelectOperatorId() {
    try {
      return _sharedPreferences!.getString('operatorid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSelectOperatorName(String value) {
    return _sharedPreferences!.setString('operatorname', value);
  }

  String getSelectOperatorName() {
    try {
      return _sharedPreferences!.getString('operatorname') ?? '';
    } catch (e) {
      return '';
    }
  }


  Future<void> setRechargeRequestId(String value) {
    return _sharedPreferences!.setString('rechargerequestid', value);
  }

  String getRechargeRequestId() {
    try {
      return _sharedPreferences!.getString('rechargerequestid') ?? '';
    } catch (e) {
      return '';
    }
  }


  Future<void> setViewClientRefId(String value) {
    return _sharedPreferences!.setString('clientrefid', value);
  }

  String getViewClientRefId() {
    try {
      return _sharedPreferences!.getString('clientrefid') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setViewBankRefId(String value) {
    return _sharedPreferences!.setString('bankrefid', value);
  }

  String getViewBankRefId() {
    try {
      return _sharedPreferences!.getString('bankrefid') ?? '';
    } catch (e) {
      return '';
    }
  }
  Future<void> setViewCustomerRefId(String value) {
    return _sharedPreferences!.setString('viewcustomerrefid', value);
  }

  String getViewCustomerRefId() {
    try {
      return _sharedPreferences!.getString('viewcustomerrefid') ?? '';
    } catch (e) {
      return '';
    }
  }
  Future<void> setViewBenificiarhyId(String value) {
    return _sharedPreferences!.setString('viewbeneid', value);
  }

  String getViewBenificiarhyId() {
    try {
      return _sharedPreferences!.getString('viewbeneid') ?? '';
    } catch (e) {
      return '';
    }
  }
  Future<void> setViewServiceCharge(String value) {
    return _sharedPreferences!.setString('viewservicecharge', value);
  }

  String getViewServiceCharge() {
    try {
      return _sharedPreferences!.getString('viewservicecharge') ?? '';
    } catch (e) {
      return '';
    }
  }




// Fund Transfer Data Storage
}
