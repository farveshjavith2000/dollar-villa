// ignore_for_file: must_be_immutable

part of 'myaccountstatements_filter_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///myaccountstatementsFilter widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class myaccountstatementsFilterEvent extends Equatable {}

/// Event that is dispatched when the myaccountstatementsFilter widget is first created.
class myaccountstatementsFilterInitialEvent extends myaccountstatementsFilterEvent {
  @override
  List<Object?> get props => [];
}
