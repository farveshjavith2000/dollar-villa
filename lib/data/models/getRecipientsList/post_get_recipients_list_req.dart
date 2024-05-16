import '../../../core/utils/pref_utils.dart';

class PostGetRecipientsListReq {

  String? senderNumber=PrefUtils().getSenderNumber();
  String? userId=PrefUtils().getMemIdForUserLoggedIn();
  String? senderName;
  String? dMTName=PrefUtils().getDMTName();
  PostGetRecipientsListReq({senderNumber, userId, this.senderName, dMTName});

  PostGetRecipientsListReq.fromJson(Map<String, dynamic> json) {
    senderNumber = json['SenderNumber'];
    userId = json['UserId'];
    senderName = json['SenderName'];
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
    if (senderName != null) {
      data['SenderName'] = senderName;
    }
    if (dMTName != null) {
      data['DMTName'] = dMTName;
    }
    return data;
  }
}
