// ignore_for_file: must_be_immutable

part of 'fund_transfer_success_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FundTransferSuccess widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FundTransferSuccessEvent extends Equatable {}

/// Event that is dispatched when the FundTransferSuccess widget is first created.
class FundTransferSuccessInitialEvent extends FundTransferSuccessEvent {
  @override
  List<Object?> get props => [];
}
