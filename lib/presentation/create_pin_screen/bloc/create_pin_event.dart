// ignore_for_file: must_be_immutable

part of 'create_pin_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CreatePin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreatePinEvent extends Equatable {}

/// Event that is dispatched when the CreatePin widget is first created.
class CreatePinInitialEvent extends CreatePinEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Create_Tpin API.
class CreateCreateTpinEvent extends CreatePinEvent {
  CreateCreateTpinEvent({
    this.onCreateCreateTpinEventSuccess,
    this.onCreateCreateTpinEventError,
  });

  Function? onCreateCreateTpinEventSuccess;

  Function? onCreateCreateTpinEventError;

  @override
  List<Object?> get props => [
        onCreateCreateTpinEventSuccess,
        onCreateCreateTpinEventError,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends CreatePinEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends CreatePinEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
