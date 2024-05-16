import 'package:dollervilla/core/app_export.dart';

class BenificiaryModel {
  final String id;
  final String name;

  BenificiaryModel({
    required this.id,
    required this.name,
  });

  factory BenificiaryModel.fromJson(Map<String, dynamic> json) {
    return BenificiaryModel(
      id: (PrefUtils().getDMTName()=="Paysdmt")?json["bankid"]:json["bankcode"],
      name: json["bankName"],
    );
  }

  static List<BenificiaryModel> fromJsonList(List list) {
    return list.map((item) => BenificiaryModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this.createdAt.toString().contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(BenificiaryModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name+"@"+id;
}