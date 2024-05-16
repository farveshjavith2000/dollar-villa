// ignore_for_file: must_be_immutable

part of 'fund_transfer_error_bloc.dart';

/// Represents the state of FundTransferError in the application.
class FundTransferErrorState extends Equatable {
  FundTransferErrorState({this.fundTransferErrorModelObj});

  FundTransferErrorModel? fundTransferErrorModelObj;

  @override
  List<Object?> get props => [
        fundTransferErrorModelObj,
      ];
  FundTransferErrorState copyWith(
      {FundTransferErrorModel? fundTransferErrorModelObj}) {
    return FundTransferErrorState(
      fundTransferErrorModelObj:
          fundTransferErrorModelObj ?? this.fundTransferErrorModelObj,
    );
  }
}
