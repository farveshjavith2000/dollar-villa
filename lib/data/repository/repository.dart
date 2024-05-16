import 'package:dollervilla/data/models/getRecipientsList/post_get_recipients_list_resp.dart';
import 'package:dollervilla/data/models/mLoginPostFunction/post_m_login_post_function_resp.dart';
import 'package:dollervilla/data/models/verifyLoginPost/post_verify_login_post_resp.dart';

import '../apiClient/api_client.dart';
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

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PostRechargeCheckStatusPostResp> rechargeCheckStatusPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.rechargeCheckStatusPost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<MyAccountResp> getAccountStatement({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.getAccountStatement(
      headers: headers,
      requestData: requestData,
    );
  }


  Future<ReportResp> generateFunctionName({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.generateFunctionName(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostSendContactFormRequestResp> sendContactFormRequest(
      {Map requestData = const {}}) async {
    return await _apiClient.sendContactFormRequest(
      requestData: requestData,
    );
  }

  Future<PostSendPrivacyPostRequestResp> sendPrivacyPostRequest(
      {Map requestData = const {}}) async {
    return await _apiClient.sendPrivacyPostRequest(
      requestData: requestData,
    );
  }

  Future<PostMyAccountStatementPostResp> myAccountStatementPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.myAccountStatementPost(
      headers: headers,
      requestData: requestData,
    );
  }
  Future<PostCheckingTpinPostResp> checkingTpinPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.checkingTpinPost(
      headers: headers,
      requestData: requestData,
    );
  }

 /* Future<PostDmt4FundTransferPostResp> dmt4FundTransferPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.dmt4FundTransferPost(
      headers: headers,
      requestData: requestData,
    );
  }*/

  Future<PostAddNewBeneficiaryResp> addNewBeneficiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.addNewBeneficiary(
      headers: headers,
      requestData: requestData,
    );
  }



  Future<PostVerifyTpinOtpResp> verifyTpinOtp({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.verifyTpinOtp(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostCreateTpinResp> createTpin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.createTpin(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostDeleteBeneficiaryResp> deleteBeneficiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.deleteBeneficiary(
      headers: headers,
      requestData: requestData,
    );
  }
  /*Future<PostDeleteBeneficiaryResp> deleteBenificiary({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.deleteBenificiary(
      headers: headers,
      requestData: requestData,
    );
  }*/
  Future<PostGetWalletBalanceResp> getWalletBalance({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.getWalletBalance(
      headers: headers,
      requestData: requestData,
    );
  }
  Future<PostGetRecipientsListResp> getRecipientsList({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.getRecipientsList(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostVerifyLoginPostResp> verifyLoginPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.verifyLoginPost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostMLoginPostFunctionResp> mLoginPostFunction({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.mLoginPostFunction(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostSendVerificationRequestResp> sendVerificationRequest({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.sendVerificationRequest(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostRegisterDmt4SenderResp> registerDmt4Sender({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.registerDmt4Sender(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostMobileRechargePostResp> mobileRechargePost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.mobileRechargePost(
      headers: headers,
      requestData: requestData,
    );
  }

}
