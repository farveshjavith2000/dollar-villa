// ignore_for_file: must_be_immutable

part of 'fund_transfer_error_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FundTransferError widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FundTransferErrorEvent extends Equatable {}

/// Event that is dispatched when the FundTransferError widget is first created.
class FundTransferErrorInitialEvent extends FundTransferErrorEvent {
  @override
  List<Object?> get props => [];
}
