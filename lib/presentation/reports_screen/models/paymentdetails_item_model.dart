import '../../../core/app_export.dart';

/// This class is used in the [paymentdetails_item_widget] screen.
class ReportdetailsItemModel {
  ReportdetailsItemModel({
    this.amount,
    this.date,
    this.date1,
    this.time,
    this.sucess,
    this.sucess1,
    this.paymentMode,
    this.paymentMode1,
    this.refNumber,
    this.refNumber1,
    this.Type,
    this.id,
    this.requestid,
    this.description,
    this.openingbalance,
    this.closingbalance,
    this.ClientRefId,
    this.BankRefId,
    this.Customer,
    this.Beneficiary,
    this.ServiceCharge
  }) {
    amount = amount ?? "Loading";
    Type = Type ?? "Loading";
    date = date ?? "Date ";
    date1 = date1 ?? "";
    time = time ?? "";
    sucess = sucess ?? "";
    sucess1 = sucess1 ?? ImageConstant.imgVectorGreen50013x13;
    paymentMode = paymentMode ?? "Payment mode";
    paymentMode1 = paymentMode1 ?? "";
    if(Constants.reportFilterType!="rechargerpt"){
      refNumber = refNumber ?? "Ref. number";
    }else{
      refNumber = refNumber ?? "Request ID";
    }

    refNumber1 = refNumber1 ?? "BROOA2J4P69";
    id = id ?? "";
    description = description ?? "Loading...";
    openingbalance=openingbalance ?? "Loading...";
    closingbalance=closingbalance ?? "Loading...";
    requestid=requestid ?? "";
    ClientRefId=ClientRefId ?? "";
    BankRefId=BankRefId?? "";
    Customer=Customer?? "";
    Beneficiary=Beneficiary?? "";
    ServiceCharge=ServiceCharge?? "";
  }

  String? amount;

  String? date;

  String? date1;

  String? time;

  String? sucess;

  String? sucess1;

  String? paymentMode;

  String? paymentMode1;

  String? refNumber;

  String? refNumber1;

  String? Type;

  String? id;

  String? requestid;
  String? description;

  String?openingbalance;
  String?closingbalance;
  String?ClientRefId;
  String?BankRefId;
  String?Customer;
  String?Beneficiary;
  String?ServiceCharge;
}
