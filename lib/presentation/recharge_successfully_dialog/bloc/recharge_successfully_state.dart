// ignore_for_file: must_be_immutable

part of 'recharge_successfully_bloc.dart';

/// Represents the state of RechargeSuccessfully in the application.
class RechargeSuccessfullyState extends Equatable {
  RechargeSuccessfullyState({this.rechargeSuccessfullyModelObj});

  RechargeSuccessfullyModel? rechargeSuccessfullyModelObj;

  @override
  List<Object?> get props => [
        rechargeSuccessfullyModelObj,
      ];
  RechargeSuccessfullyState copyWith(
      {RechargeSuccessfullyModel? rechargeSuccessfullyModelObj}) {
    return RechargeSuccessfullyState(
      rechargeSuccessfullyModelObj:
          rechargeSuccessfullyModelObj ?? this.rechargeSuccessfullyModelObj,
    );
  }
}
