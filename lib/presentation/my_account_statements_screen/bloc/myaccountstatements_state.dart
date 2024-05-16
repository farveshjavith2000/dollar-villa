// ignore_for_file: must_be_immutable

part of 'myaccountstatements_bloc.dart';

/// Represents the state of myaccountstatements in the application.
class myaccountstatementsState extends Equatable {
  myaccountstatementsState({
    this.accountnumber,
    this.transacionid,
    this.fromdate,
    this.todate,
    this.customermobile,
    this.myaccountstatementsModelObj,
  });

  myaccountstatementsModel? myaccountstatementsModelObj;

  var accountnumber;

  var transacionid;

  var fromdate;

  var todate;

  var customermobile;

  @override
  List<Object?> get props => [
        accountnumber,
        transacionid,
        fromdate,
        todate,
        customermobile,
        myaccountstatementsModelObj,
      ];
  myaccountstatementsState copyWith({
    var accountnumber,
    var transacionid,
    var fromdate,
    var todate,
    var customermobile,
    myaccountstatementsModel? myaccountstatementsModelObj,
  }) {
    return myaccountstatementsState(
      accountnumber: accountnumber ?? this.accountnumber,
      transacionid: transacionid ?? this.transacionid,
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      customermobile: customermobile ?? this.customermobile,
      myaccountstatementsModelObj: myaccountstatementsModelObj ?? this.myaccountstatementsModelObj,
    );
  }
}
