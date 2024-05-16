class PostSendPrivacyPostRequestResp {
  String? status;
  String? name;
  String? details;

  PostSendPrivacyPostRequestResp({this.status, this.name, this.details});

  PostSendPrivacyPostRequestResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (details != null) {
      data['details'] = details;
    }
    return data;
  }
}
