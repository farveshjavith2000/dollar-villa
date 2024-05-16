// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [recharge_check_status_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RechargeCheckStatusModel extends Equatable {
  RechargeCheckStatusModel({
    this.price = "",
    this.oct = "",
    this.Type = "",
    this.transID = "",
    this.MobileNo = "",
    this.RequestID = "",
    this.ServiceProvider = "",
  }) {}

  String price;

  String oct;

  String Type;

  String transID;
  String MobileNo;
  String RequestID;
  String ServiceProvider;

  RechargeCheckStatusModel copyWith(
      {String? price,
      String? oct,
      String? Type,
      String? transID,
      String? MobileNo,
      String? RequestID,
      String? ServiceProvider}) {
    return RechargeCheckStatusModel(
      price: price ?? this.price,
      oct: oct ?? this.oct,
      Type: Type ?? this.Type,
      transID: transID ?? this.transID,
      MobileNo: MobileNo ?? this.MobileNo,
      RequestID: RequestID ?? this.RequestID,
      ServiceProvider: ServiceProvider ?? this.ServiceProvider,
    );
  }

  @override
  List<Object?> get props =>
      [price, oct, Type, transID, MobileNo, RequestID, ServiceProvider];
}
