// ignore_for_file: must_be_immutable

part of 'verify_email_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///VerifyEmail widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class VerifyEmailEvent extends Equatable {}

/// Event that is dispatched when the VerifyEmail widget is first created.
class VerifyEmailInitialEvent extends VerifyEmailEvent {
  @override
  List<Object?> get props => [];
}
