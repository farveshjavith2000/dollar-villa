// ignore_for_file: must_be_immutable

part of 'add_money_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddMoney widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddMoneyEvent extends Equatable {}

/// Event that is dispatched when the AddMoney widget is first created.
class AddMoneyInitialEvent extends AddMoneyEvent {
  @override
  List<Object?> get props => [];
}
