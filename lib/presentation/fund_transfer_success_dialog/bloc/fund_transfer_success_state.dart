// ignore_for_file: must_be_immutable

part of 'fund_transfer_success_bloc.dart';

/// Represents the state of FundTransferSuccess in the application.
class FundTransferSuccessState extends Equatable {
  FundTransferSuccessState({this.fundTransferSuccessModelObj});

  FundTransferSuccessModel? fundTransferSuccessModelObj;

  @override
  List<Object?> get props => [
        fundTransferSuccessModelObj,
      ];
  FundTransferSuccessState copyWith(
      {FundTransferSuccessModel? fundTransferSuccessModelObj}) {
    return FundTransferSuccessState(
      fundTransferSuccessModelObj:
          fundTransferSuccessModelObj ?? this.fundTransferSuccessModelObj,
    );
  }
}
