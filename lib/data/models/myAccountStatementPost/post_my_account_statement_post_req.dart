class PostMyAccountStatementPostReq {
  String? userId;
  String? transDateStart;
  String? transDateEnd;

  PostMyAccountStatementPostReq(
      {this.userId, this.transDateStart, this.transDateEnd});

  PostMyAccountStatementPostReq.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    transDateStart = json['TransDateStart'];
    transDateEnd = json['TransDateEnd'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (transDateStart != null) {
      data['TransDateStart'] = transDateStart;
    }
    if (transDateEnd != null) {
      data['TransDateEnd'] = transDateEnd;
    }
    return data;
  }
}
