import '../../../core/utils/pref_utils.dart';

class PostGetWalletBalanceReq {
  String? memid=PrefUtils().getMemIdForUserLoggedIn();

  PostGetWalletBalanceReq({memid});

  PostGetWalletBalanceReq.fromJson(Map<String, dynamic> json) {
    memid = json['memid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (memid != null) {
      data['memid'] = memid;
    }
    return data;
  }
}
