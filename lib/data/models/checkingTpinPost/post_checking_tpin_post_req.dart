class PostCheckingTpinPostReq {
  String? userId;
  String? tpin;

  PostCheckingTpinPostReq({this.userId, this.tpin});

  PostCheckingTpinPostReq.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tpin = json['tpin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['user_id'] = userId;
    }
    if (tpin != null) {
      data['tpin'] = tpin;
    }
    return data;
  }
}
