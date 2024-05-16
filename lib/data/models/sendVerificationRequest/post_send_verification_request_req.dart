import '../../../core/constants/constants.dart';
import '../../../core/utils/pref_utils.dart';

class PostSendVerificationRequestReq {
  String? senderNumber;
  //String? userId;
  String? dMTName;
  String? userId=PrefUtils().getMemIdForUserLoggedIn();
  PostSendVerificationRequestReq(
      {this.senderNumber, userId, this.dMTName});

  PostSendVerificationRequestReq.fromJson(Map<String, dynamic> json) {

    senderNumber = json['SenderNumber'];
    userId = json['UserId'];
    dMTName = json['DMTName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (senderNumber != null) {
      data['SenderNumber'] = senderNumber;
    }
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (dMTName != null) {
      data['DMTName'] = dMTName;
    }
    return data;
  }
}
