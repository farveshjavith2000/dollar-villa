class PostGenerateFunctionNameReq {
  String? userId;
  String? todate;
  String? transDateStart;
  String? transDateEnd;
  String? cusTid;
  String? cusAcc;
  String? cusMobile;

  PostGenerateFunctionNameReq(
      {this.userId,
      this.todate,
      this.transDateStart,
      this.transDateEnd,
      this.cusTid,
      this.cusAcc,
      this.cusMobile});

  PostGenerateFunctionNameReq.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    todate = json['todate'];
    transDateStart = json['TransDateStart'];
    transDateEnd = json['TransDateEnd'];
    cusTid = json['CusTid'];
    cusAcc = json['CusAcc'];
    cusMobile = json['CusMobile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['UserId'] = userId;
    }
    if (todate != null) {
      data['todate'] = todate;
    }
    if (transDateStart != null) {
      data['TransDateStart'] = transDateStart;
    }
    if (transDateEnd != null) {
      data['TransDateEnd'] = transDateEnd;
    }
    if (cusTid != null) {
      data['CusTid'] = cusTid;
    }
    if (cusAcc != null) {
      data['CusAcc'] = cusAcc;
    }
    if (cusMobile != null) {
      data['CusMobile'] = cusMobile;
    }
    return data;
  }
}
