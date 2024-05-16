// ignore_for_file: must_be_immutable

part of 'myaccountstatements_detail_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///myaccountstatementsDetail widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class myaccountstatementsDetailEvent extends Equatable {}

/// Event that is dispatched when the myaccountstatementsDetail widget is first created.
class myaccountstatementsDetailInitialEvent extends myaccountstatementsDetailEvent {
  @override
  List<Object?> get props => [];
}
