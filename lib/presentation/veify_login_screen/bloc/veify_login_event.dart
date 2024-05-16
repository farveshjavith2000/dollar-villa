// ignore_for_file: must_be_immutable

part of 'veify_login_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///VeifyLogin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class VeifyLoginEvent extends Equatable {}

/// Event that is dispatched when the VeifyLogin widget is first created.
class VeifyLoginInitialEvent extends VeifyLoginEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/VerifyLogin API.
class CreateVerifyLoginEvent extends VeifyLoginEvent {
  CreateVerifyLoginEvent({
    this.onCreateVerifyLoginEventSuccess,
    this.onCreateVerifyLoginEventError,
  });

  Function? onCreateVerifyLoginEventSuccess;

  Function? onCreateVerifyLoginEventError;

  @override
  List<Object?> get props => [
        onCreateVerifyLoginEventSuccess,
        onCreateVerifyLoginEventError,
      ];
}
