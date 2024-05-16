import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/progress_dialog_utils.dart';
import 'package:dollervilla/data/models/getRecipientsList/post_get_recipients_list_resp.dart';
import 'package:dollervilla/data/models/mLoginPostFunction/post_m_login_post_function_resp.dart';
import 'package:dollervilla/data/models/verifyLoginPost/post_verify_login_post_resp.dart';
import 'package:flutter/material.dart';

import '../../presentation/fund_transfer_error_dialog/fund_transfer_error_dialog.dart';
import '../models/addNewBeneficiary/post_add_new_beneficiary_resp.dart';
import '../models/checkingTpinPost/post_checking_tpin_post_resp.dart';
import '../models/createTpin/post_create_tpin_resp.dart';
import '../models/deleteBeneficiary/post_delete_beneficiary_resp.dart';
import '../models/dmt4FundTransferPost/post_dmt4_fund_transfer_post_resp.dart';
import '../models/generateFunctionName/myaccount_resp.dart';

import '../models/generateFunctionName/report_resp.dart';
import '../models/getWalletBalance/post_get_wallet_balance_resp.dart';
import '../models/mobileRechargePost/post_mobile_recharge_post_resp.dart';
import '../models/myAccountStatementPost/post_my_account_statement_post_resp.dart';
import '../models/rechargeCheckStatusPost/post_recharge_check_status_post_resp.dart';
import '../models/registerDmt4Sender/post_register_dmt4_sender_resp.dart';
import '../models/sendContactFormRequest/post_send_contact_form_request_resp.dart';
import '../models/sendPrivacyPostRequest/post_send_privacy_post_request_resp.dart';
import '../models/sendVerificationRequest/post_send_verification_request_resp.dart';
import '../models/verifyTpinOtp/post_verify_tpin_otp_resp.dart';
import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "https://app.victoriaepay.com";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  var status = "";
  var errorMsg = "";
  var errorCode = "";
  var msg = "";

  fundTransfer(mobile, benname, name, account, amount, ifsc, recipient_id,
      transactionmode, url) async {
    var urlpharse = '';
    print("PrefUtils().getDMTName() " + PrefUtils().getDMTName());

    if (PrefUtils().getDMTName() == '') {
      urlpharse = url + '/FundTransfer';
    }
    if (PrefUtils().getDMTName() == "Paysdmt") {
      urlpharse = url + '/Dmt4FundTransfer';
    }
    var UserId = PrefUtils().getMemIdForUserLoggedIn();
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({
      "mobile_number": "$mobile",
      "UserId": "$UserId",
      "name": "$name",
      "recipient_mobile": "$mobile",
      "account": "$account",
      "bname": "$benname",
      "transmode": "$transactionmode",
      "amount": "$amount",
      "Ifsc": "$ifsc",
      "BeneName": "$benname",
      "recipient_id": "$recipient_id",
      "moveType": "",
      "member_id": "$UserId"
    });
    print("Fund data:$data");
    print("Fund Transfer URL:" + '$urlpharse');
    var dio = Dio();
    var response = await dio.request(
      '$urlpharse',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      var result = json.decode(response.toString());
      print("result:$result");
      status = result['status'];
      errorMsg = result['errorMsg'];
      msg = result['errorMsg'];
      errorCode = result['errorCode'];
      if (status == '0') {
        //if (PrefUtils().getDMTName() == "Paysdmt") {
        errorMsg = result['errorMsg'];
        /*}else{
          errorMsg = result['msg'];
        }*/
        Fluttertoast.showToast(msg: errorMsg);
        NavigatorService.pushNamed(
          AppRoutes.beneficiarySearchScreen,
        );
      } else {
        Fluttertoast.showToast(msg: errorMsg);
      }
    } else {
      print(response.statusMessage);
    }
  }


  /// Performs API call for https://app.victoriaepay.com/Contact
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Contact' endpoint
  /// with the provided headers and request data
  /// Returns a [PostSendContactFormRequestResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostSendContactFormRequestResp> sendContactFormRequest(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Contact',
        data: requestData,
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostSendContactFormRequestResp.fromJson(
            json.decode(response.data));
      } else {
        throw response.data != null
            ? PostSendContactFormRequestResp.fromJson(
            json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Privacy
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Privacy' endpoint
  /// with the provided headers and request data
  /// Returns a [PostSendPrivacyPostRequestResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostSendPrivacyPostRequestResp> sendPrivacyPostRequest(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Privacy',
        data: requestData,
        options: Options(),
      );
      print('Privacy requestData');
      print('$requestData');
      print('Privacy  URL');
      print('$url/Privacy');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostSendPrivacyPostRequestResp.fromJson(
            json.decode(response.data));
      } else {
        throw response.data != null
            ? PostSendPrivacyPostRequestResp.fromJson(
            json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/MyAccountStatement
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/MyAccountStatement' endpoint
  /// with the provided headers and request data
  /// Returns a [PostMyAccountStatementPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostMyAccountStatementPostResp> myAccountStatementPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/MyAccountStatement',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostMyAccountStatementPostResp.fromJson(
            json.decode(response.data));
      } else {
        throw response.data != null
            ? PostMyAccountStatementPostResp.fromJson(
            json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// Performs API call for https://app.victoriaepay.com/Checking_Tpin
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Checking_Tpin' endpoint
  /// with the provided headers and request data
  /// Returns a [PostCheckingTpinPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostCheckingTpinPostResp> checkingTpinPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Checking_Tpin',
        data: requestData,
        options: Options(headers: headers),
      );
      print('Checking_Tpin : $requestData');
      print('$url/Checking_Tpin');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("Transaction Sucessfully fo this ReceipintId:");
        print(PrefUtils().getFundTranReceipientId());
        print("Checking Tpin Response:");
        print(response);

        var result = json.decode(response.toString());
        if (result['status'] == "0") {
          fundTransfer(
              PrefUtils().getSenderNumber(),
              PrefUtils().getFundTranBenName(),
              PrefUtils().getFundTranName(),
              PrefUtils().getFundTranAccountNo(),
              PrefUtils().getFundTranAmount(),
              PrefUtils().getFundTranIFSCNo(),
              PrefUtils().getFundTranReceipientId(),
              PrefUtils().getFundTranMode(),
              url);
        }
        return PostCheckingTpinPostResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostCheckingTpinPostResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Dmt4FundTransfer
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4FundTransfer' endpoint
  /// with the provided headers and request data
  /// Returns a [PostDmt4FundTransferPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  /*Future<PostDmt4FundTransferPostResp> dmt4FundTransferPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {

      var urlpharse = '';
      if (PrefUtils().getDMTName() == 'dmt1') {
        urlpharse = 'FundTransfer';
      }
      if (PrefUtils().getDMTName() == "Paysdmt") {
        urlpharse = 'Dmt4FundTransfer';
      }
      await isNetworkConnected();
      var response = await _dio.post(
        '$url'+'/'+'$urlpharse',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostDmt4FundTransferPostResp.fromJson(
            json.decode(response.data));
      } else {
        throw response.data != null
            ? PostDmt4FundTransferPostResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }*/

  /// Performs API call for https://app.victoriaepay.com/Dmt4AddNewBeneficiary
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4AddNewBeneficiary' endpoint
  /// with the provided headers and request data
  /// Returns a [PostAddNewBeneficiaryResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostAddNewBeneficiaryResp> addNewBeneficiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var urlpharse = '';
      if (PrefUtils().getDMTName() == '') {
        urlpharse = 'RegNewRecipient';
      }
      if (PrefUtils().getDMTName() == "Paysdmt") {
        urlpharse = 'Dmt4AddNewBeneficiary';
      }
      var response = await _dio.post(
        '$url/$urlpharse',
        data: requestData,
        options: Options(headers: headers),
      );
      print("requestData : $requestData");
      print("Request URL:");
      print('$url/$urlpharse');

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostAddNewBeneficiaryResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostAddNewBeneficiaryResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/VerifyTpinotp
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/VerifyTpinotp' endpoint
  /// with the provided headers and request data
  /// Returns a [PostVerifyTpinOtpResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostVerifyTpinOtpResp> verifyTpinOtp({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/VerifyTpinotp',
        data: requestData,
        options: Options(headers: headers),
      );
      print('$url/VerifyTpinotp');
      print('requestData: $requestData');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostVerifyTpinOtpResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostVerifyTpinOtpResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Create_Tpin
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Create_Tpin' endpoint
  /// with the provided headers and request data
  /// Returns a [PostCreateTpinResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostCreateTpinResp> createTpin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Create_Tpin',
        data: requestData,
        options: Options(headers: headers),
      );
      print("Request Data $requestData");
      print("Create Pin URL:");
      print('$url/Create_Tpin');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostCreateTpinResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostCreateTpinResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/DeleteBenificiary
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/DeleteBenificiary' endpoint
  /// with the provided headers and request data
  /// Returns a [PostDeleteBenificiaryResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  /*Future<PostDeleteBeneficiaryResp> deleteBenificiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var redurl = "";
      if (PrefUtils().getDMTName() == "Paysdmt") {
        redurl = '$url/Dmt4DeleteBeneficiary';
      } else {
        redurl = '$url/DeleteBenificiary';
      }
      await isNetworkConnected();
      var response = await _dio.post(
        '$redurl',
        data: requestData,
        options: Options(headers: headers),
      );
      print('$requestData');
      print('Delete Beneficiary : $redurl');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostDeleteBeneficiaryResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostDeleteBeneficiaryResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }*/


  /// Performs API call for https://app.victoriaepay.com/Dmt4DeleteBeneficiary
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4DeleteBeneficiary' endpoint
  /// with the provided headers and request data
  /// Returns a [PostDeleteBeneficiaryResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostDeleteBeneficiaryResp> deleteBeneficiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var redurl = "";
      if (PrefUtils().getDMTName() == "Paysdmt") {
        redurl = '$url/Dmt4DeleteBeneficiary';
      } else {
        redurl = '$url/DeleteBenificiary';
      }
      await isNetworkConnected();
      print("sathish");
      print(requestData);
      print('$redurl');
      var response = await _dio.post(
        '$redurl',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      print("Delete Response:$response");
      if (_isSuccessCall(response)) {
        return PostDeleteBeneficiaryResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostDeleteBeneficiaryResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/GetRecipientsList
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/GetRecipientsList' endpoint
  /// with the provided headers and request data
  /// Returns a [PostGetRecipientsListResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostGetRecipientsListResp> getRecipientsList({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var urlphrase = "";
      if (PrefUtils().getDMTName() == "Paysdmt") {
        urlphrase = '$url/Dmt4GetRecipientsList';
      } else {
        urlphrase = '$url/GetRecipientsList';
      }

      await isNetworkConnected();
      var response = await _dio.post(
        '$urlphrase',
        data: requestData,
        options: Options(headers: headers),
      );
      print("requestData GetRecipientsList $requestData");
      print('$urlphrase');
      ProgressDialogUtils.hideProgressDialog();
      print('response : $response');
      if (_isSuccessCall(response)) {
        return PostGetRecipientsListResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostGetRecipientsListResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/VerifyLogin
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/VerifyLogin' endpoint
  /// with the provided headers and request data
  /// Returns a [PostVerifyLoginPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostVerifyLoginPostResp> verifyLoginPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/VerifyLogin',
        data: requestData,
        options: Options(headers: headers),
      );
      print("VerifyLogin POST URL:");
      print('$url/VerifyLogin');
      print("VerifyLogin POST Request:");
      print(requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("Response Data");
        print(response.data);
        return PostVerifyLoginPostResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostVerifyLoginPostResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/mLogin
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/mLogin' endpoint
  /// with the provided headers and request data
  /// Returns a [PostMLoginPostFunctionResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostMLoginPostFunctionResp> mLoginPostFunction({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/mLogin',
        data: requestData,
        options: Options(headers: headers),
      );
      print("requestData $requestData");
      print('$url/mLogin');

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostMLoginPostFunctionResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostMLoginPostFunctionResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/WalletBalance
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/WalletBalance' endpoint
  /// with the provided headers and request data
  /// Returns a [PostGetWalletBalanceResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostGetWalletBalanceResp> getWalletBalance({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/WalletBalance',
        data: requestData,
        options: Options(headers: headers),
      );
      print(requestData);
      print('$url/WalletBalance');

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostGetWalletBalanceResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostGetWalletBalanceResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Dmt4SenderVerification
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4SenderVerification' endpoint
  /// with the provided headers and request data
  /// Returns a [PostSendVerificationRequestResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostSendVerificationRequestResp> sendVerificationRequest({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var urlphrase = "";
      print("PrefUtils().getDMTName() " + PrefUtils().getDMTName());
      if (PrefUtils().getDMTName() == "Paysdmt") {
        urlphrase = '$url/Dmt4SenderVerification';
      } else {
        urlphrase = '$url/SenderVerification';
      }

      var response = await _dio.post(
        '$urlphrase',
        data: requestData,
        options: Options(headers: headers),
      );
      //}
      print("requestData : $requestData");
      print('$urlphrase');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostSendVerificationRequestResp.fromJson(
            json.decode(response.data));
      } else {
        throw response.data != null
            ? PostSendVerificationRequestResp.fromJson(
            json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Dmt4SenderRegistration
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4SenderRegistration' endpoint
  /// with the provided headers and request data
  /// Returns a [PostRegisterDmt4SenderResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostRegisterDmt4SenderResp> registerDmt4Sender({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Dmt4SenderRegistration',
        data: requestData,
        options: Options(headers: headers),
      );
      print('requestData : $requestData');
      print('$url/Dmt4SenderRegistration');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegisterDmt4SenderResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostRegisterDmt4SenderResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/Dmt4Report
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4Report' endpoint
  /// with the provided headers and request data
  /// Returns a [PostGenerateFunctionNameResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<ReportResp> generateFunctionName({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      print(Constants.reportFilterType);
      var urlphrase = "$url/Dmt_Report1";
      if (Constants.reportFilterType == "dmt4") {
        urlphrase = '$url/Dmt4Report';
      }

      if (Constants.reportFilterType == "dmt1") {
        urlphrase = '$url/Dmt_Report1';
      }

      if (Constants.reportFilterType == "rechargerpt") {
        urlphrase = '$url/RechargeReport';
      }



      // else{
      //   urlphrase = '$url/Dmt_Report1';
      // }
      ///urlphrase = '$url/Dmt_Report1';
      var response = await _dio.post(
        '$urlphrase',
        data: requestData,
        options: Options(headers: headers),
      );
      print('Request URL Report:');
      print('$urlphrase');
      print('Request Data Report:');
      print(requestData);
      ProgressDialogUtils.hideProgressDialog();
      print('Response Data Report:');
      print(response);
      if (_isSuccessCall(response)) {
        return ReportResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? ReportResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// Performs API call for https://app.victoriaepay.com/Dmt4Report
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Dmt4Report' endpoint
  /// with the provided headers and request data
  /// Returns a [PostGenerateFunctionNameResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<MyAccountResp> getAccountStatement({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      var urlphrase = "";
      if (PrefUtils().getDMTName() == "Paysdmt") {
        urlphrase = '$url/MyAccountStatement';
      } else {
        urlphrase = '$url/MyAccountStatement';
      }
      urlphrase = '$url/MyAccountStatement';
      var response = await _dio.post(
        '$urlphrase',
        data: requestData,
        options: Options(headers: headers),
      );
      print('Request URL MyAccountStatement:');
      print('$urlphrase');
      print('Request Data MyAccountStatement:');
      print(requestData);
      ProgressDialogUtils.hideProgressDialog();
      print('Response Data MyAccountStatement:');
      print(response);
      if (_isSuccessCall(response)) {
        return MyAccountResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? MyAccountResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://app.victoriaepay.com/MobileRecharge
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/MobileRecharge' endpoint
  /// with the provided headers and request data
  /// Returns a [PostMobileRechargePostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostMobileRechargePostResp> mobileRechargePost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      print("Mobile Recharge URL:");
      print('$url/MobileRecharge');
      print("Mobile Recharge Request Data:");
      print(requestData);
      var response = await _dio.post(
        '$url/MobileRecharge',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostMobileRechargePostResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostMobileRechargePostResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// Performs API call for https://app.victoriaepay.com/Rechargecheckstatus
  ///
  /// Sends a POST request to the server's 'https://app.victoriaepay.com/Rechargecheckstatus' endpoint
  /// with the provided headers and request data
  /// Returns a [PostRechargeCheckStatusPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostRechargeCheckStatusPostResp> rechargeCheckStatusPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Rechargecheckstatus',
        data: requestData,
        options: Options(headers: headers),
      );
      print('$url/Rechargecheckstatus');
      print('$response');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRechargeCheckStatusPostResp.fromJson(json.decode(response.data));
      } else {
        throw response.data != null
            ? PostRechargeCheckStatusPostResp.fromJson(json.decode(response.data))
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


}
