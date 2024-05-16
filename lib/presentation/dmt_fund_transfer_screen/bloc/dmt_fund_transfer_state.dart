// ignore_for_file: must_be_immutable

part of 'dmt_fund_transfer_bloc.dart';

/// Represents the state of DmtFundTransfer in the application.
class DmtFundTransferState extends Equatable {
  DmtFundTransferState({
    this.amountController,
    this.selectedDropDownValue,
    this.member_id,
    this.moveType,
    this.recipient_id,
    this.BeneName,
    this.Ifsc,
    this.amount,
    this.transmode,
    this.bname,
    this.account,
    this.recipient_mobile,
    this.name,
    this.userid,
    this.mobile,
    this.dmtFundTransferModelObj,
  });

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  DmtFundTransferModel? dmtFundTransferModelObj;

  var member_id;

  var moveType;

  var recipient_id;

  var BeneName;

  var Ifsc;

  var amount;

  var transmode;

  var bname;

  var account;

  var recipient_mobile;

  var name;

  var userid;

  var mobile;

  @override
  List<Object?> get props => [
        amountController,
        selectedDropDownValue,
        member_id,
        moveType,
        recipient_id,
        BeneName,
        Ifsc,
        amount,
        transmode,
        bname,
        account,
        recipient_mobile,
        name,
        userid,
        mobile,
        dmtFundTransferModelObj,
      ];
  DmtFundTransferState copyWith({
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    var member_id,
    var moveType,
    var recipient_id,
    var BeneName,
    var Ifsc,
    var amount,
    var transmode,
    var bname,
    var account,
    var recipient_mobile,
    var name,
    var userid,
    var mobile,
    DmtFundTransferModel? dmtFundTransferModelObj,
  }) {
    print("this.amountController");

    return DmtFundTransferState(
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      member_id: member_id ?? this.member_id,
      moveType: moveType ?? this.moveType,
      recipient_id: recipient_id ?? this.recipient_id,
      BeneName: BeneName ?? this.BeneName,
      Ifsc: Ifsc ?? this.Ifsc,
      amount: amount ?? this.amount,
      transmode: transmode ?? this.transmode,
      bname: bname ?? this.bname,
      account: account ?? this.account,
      recipient_mobile: recipient_mobile ?? this.recipient_mobile,
      name: name ?? this.name,
      userid: userid ?? this.userid,
      mobile: mobile ?? this.mobile,
      dmtFundTransferModelObj:
          dmtFundTransferModelObj ?? this.dmtFundTransferModelObj,
    );
  }
}
