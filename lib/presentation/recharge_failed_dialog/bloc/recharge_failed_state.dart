// ignore_for_file: must_be_immutable

part of 'recharge_failed_bloc.dart';

/// Represents the state of RechargeFailed in the application.
class RechargeFailedState extends Equatable {
  RechargeFailedState({this.rechargeFailedModelObj});

  RechargeFailedModel? rechargeFailedModelObj;

  @override
  List<Object?> get props => [
        rechargeFailedModelObj,
      ];
  RechargeFailedState copyWith({RechargeFailedModel? rechargeFailedModelObj}) {
    return RechargeFailedState(
      rechargeFailedModelObj:
          rechargeFailedModelObj ?? this.rechargeFailedModelObj,
    );
  }
}
