// ignore_for_file: must_be_immutable

part of 'dmt_fund_transfer_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtFundTransfer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtFundTransferEvent extends Equatable {}

/// Event that is dispatched when the DmtFundTransfer widget is first created.
class DmtFundTransferInitialEvent extends DmtFundTransferEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends DmtFundTransferEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
