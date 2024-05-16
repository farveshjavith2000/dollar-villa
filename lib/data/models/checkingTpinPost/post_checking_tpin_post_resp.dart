class PostCheckingTpinPostResp {
  String? status;
  String? message;
  String? detail;

  PostCheckingTpinPostResp({this.status, this.message, this.detail});

  PostCheckingTpinPostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    detail = json['Detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (detail != null) {
      data['Detail'] = detail;
    }
    return data;
  }
}
