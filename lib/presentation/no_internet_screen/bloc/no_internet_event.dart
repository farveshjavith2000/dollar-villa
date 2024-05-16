// ignore_for_file: must_be_immutable

part of 'no_internet_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NoInternet widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NoInternetEvent extends Equatable {}

/// Event that is dispatched when the NoInternet widget is first created.
class NoInternetInitialEvent extends NoInternetEvent {
  @override
  List<Object?> get props => [];
}
