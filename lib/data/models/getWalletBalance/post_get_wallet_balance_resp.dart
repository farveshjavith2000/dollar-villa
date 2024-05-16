import 'package:dollervilla/core/utils/pref_utils.dart';

class PostGetWalletBalanceResp {
  String? walletBalance;

  PostGetWalletBalanceResp({this.walletBalance});

  PostGetWalletBalanceResp.fromJson(Map<String, dynamic> json) {
    walletBalance = json['Wallet_Balance'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (walletBalance != null) {

      data['Wallet_Balance'] = walletBalance;
    }
    return data;
  }
}
