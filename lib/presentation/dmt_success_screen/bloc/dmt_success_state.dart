// ignore_for_file: must_be_immutable

part of 'dmt_success_bloc.dart';

/// Represents the state of DmtSuccess in the application.
class DmtSuccessState extends Equatable {
  DmtSuccessState({this.dmtSuccessModelObj});

  DmtSuccessModel? dmtSuccessModelObj;

  @override
  List<Object?> get props => [
        dmtSuccessModelObj,
      ];
  DmtSuccessState copyWith({DmtSuccessModel? dmtSuccessModelObj}) {
    return DmtSuccessState(
      dmtSuccessModelObj: dmtSuccessModelObj ?? this.dmtSuccessModelObj,
    );
  }
}
