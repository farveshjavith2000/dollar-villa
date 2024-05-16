class PostSendContactFormRequestResp {
  String? status;
  String? name;
  String? address;
  String? contactno;
  String? email;

  PostSendContactFormRequestResp(
      {this.status, this.name, this.address, this.contactno, this.email});

  PostSendContactFormRequestResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    address = json['address'];
    contactno = json['contactno'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (address != null) {
      data['address'] = address;
    }
    if (contactno != null) {
      data['contactno'] = contactno;
    }
    if (email != null) {
      data['email'] = email;
    }
    return data;
  }
}
