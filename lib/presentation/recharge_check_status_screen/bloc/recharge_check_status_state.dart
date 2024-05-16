// ignore_for_file: must_be_immutable

part of 'recharge_check_status_bloc.dart';

/// Represents the state of RechargeCheckStatus in the application.
class RechargeCheckStatusState extends Equatable {
  RechargeCheckStatusState({this.rechargeCheckStatusModelObj});

  RechargeCheckStatusModel? rechargeCheckStatusModelObj;

  @override
  List<Object?> get props => [
        rechargeCheckStatusModelObj,
      ];
  RechargeCheckStatusState copyWith(
      {RechargeCheckStatusModel? rechargeCheckStatusModelObj}) {
    return RechargeCheckStatusState(
      rechargeCheckStatusModelObj:
          rechargeCheckStatusModelObj ?? this.rechargeCheckStatusModelObj,
    );
  }
}
