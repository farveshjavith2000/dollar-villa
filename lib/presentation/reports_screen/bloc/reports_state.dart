// ignore_for_file: must_be_immutable

part of 'reports_bloc.dart';

/// Represents the state of Reports in the application.
class ReportsState extends Equatable {
  ReportsState({
    this.accountnumber,
    this.transacionid,
    this.fromdate,
    this.todate,
    this.customermobile,
    this.reportsModelObj,
  });

  ReportsModel? reportsModelObj;

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
        reportsModelObj,
      ];
  ReportsState copyWith({
    var accountnumber,
    var transacionid,
    var fromdate,
    var todate,
    var customermobile,
    ReportsModel? reportsModelObj,
  }) {
    return ReportsState(
      accountnumber: accountnumber ?? this.accountnumber,
      transacionid: transacionid ?? this.transacionid,
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      customermobile: customermobile ?? this.customermobile,
      reportsModelObj: reportsModelObj ?? this.reportsModelObj,
    );
  }
}
