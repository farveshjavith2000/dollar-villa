// ignore_for_file: must_be_immutable

part of 'recharge_payment_failed_bloc.dart';

/// Represents the state of RechargePaymentFailed in the application.
class RechargePaymentFailedState extends Equatable {
  RechargePaymentFailedState({this.rechargePaymentFailedModelObj});

  RechargePaymentFailedModel? rechargePaymentFailedModelObj;

  @override
  List<Object?> get props => [
        rechargePaymentFailedModelObj,
      ];
  RechargePaymentFailedState copyWith(
      {RechargePaymentFailedModel? rechargePaymentFailedModelObj}) {
    return RechargePaymentFailedState(
      rechargePaymentFailedModelObj:
          rechargePaymentFailedModelObj ?? this.rechargePaymentFailedModelObj,
    );
  }
}
