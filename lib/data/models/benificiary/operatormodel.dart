import 'package:dollervilla/core/app_export.dart';

class OperatorModel {
  final String OperatorId;
  final String OperatorName;

  OperatorModel({
    required this.OperatorId,
    required this.OperatorName,
  });

  factory OperatorModel.fromJson(Map<String, dynamic> json) {
    return OperatorModel(
      OperatorId:  (PrefUtils().getPage() == "lbl_bbps_payment")?json["Id"]:json["OperatorId"],
      OperatorName: (PrefUtils().getPage() == "lbl_bbps_payment")?json["BillerName"]:json["OperatorName"],
    );
  }

  static List<OperatorModel> fromJsonList(List list) {
    return list.map((item) => OperatorModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.OperatorId} ${this.OperatorName}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this.createdAt.toString().contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(OperatorModel model) {
    return this.OperatorId == model.OperatorId;
  }

  @override
  String toString() => OperatorName+"@"+OperatorId;
}