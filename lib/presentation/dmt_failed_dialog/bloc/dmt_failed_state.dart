// ignore_for_file: must_be_immutable

part of 'dmt_failed_bloc.dart';

/// Represents the state of DmtFailed in the application.
class DmtFailedState extends Equatable {
  DmtFailedState({this.dmtFailedModelObj});

  DmtFailedModel? dmtFailedModelObj;

  @override
  List<Object?> get props => [
        dmtFailedModelObj,
      ];
  DmtFailedState copyWith({DmtFailedModel? dmtFailedModelObj}) {
    return DmtFailedState(
      dmtFailedModelObj: dmtFailedModelObj ?? this.dmtFailedModelObj,
    );
  }
}
