class PostRechargeCheckStatusPostReq {
  String? userId;
  String? clientId;

  PostRechargeCheckStatusPostReq({this.userId, this.clientId});

  PostRechargeCheckStatusPostReq.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    clientId = json['ClientId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (clientId != null) {
      data['ClientId'] = clientId;
    }
    return data;
  }
}
