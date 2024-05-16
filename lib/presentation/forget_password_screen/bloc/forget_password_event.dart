// ignore_for_file: must_be_immutable

part of 'forget_password_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ForgetPassword widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ForgetPasswordEvent extends Equatable {}

/// Event that is dispatched when the ForgetPassword widget is first created.
class ForgetPasswordInitialEvent extends ForgetPasswordEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends ForgetPasswordEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends ForgetPasswordEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
