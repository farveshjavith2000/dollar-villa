// ignore_for_file: must_be_immutable

part of 'myaccountstatements_detail_bloc.dart';

/// Represents the state of myaccountstatementsDetail in the application.
class myaccountstatementsDetailState extends Equatable {
  myaccountstatementsDetailState({this.myaccountstatementsDetailModelObj});

  myaccountstatementsDetailModel? myaccountstatementsDetailModelObj;

  @override
  List<Object?> get props => [
        myaccountstatementsDetailModelObj,
      ];
  myaccountstatementsDetailState copyWith({myaccountstatementsDetailModel? myaccountstatementsDetailModelObj}) {
    return myaccountstatementsDetailState(
      myaccountstatementsDetailModelObj:
          myaccountstatementsDetailModelObj ?? this.myaccountstatementsDetailModelObj,
    );
  }
}
