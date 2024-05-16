// ignore_for_file: must_be_immutable

part of 'dmt_new_registration_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtNewRegistration widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtNewRegistrationEvent extends Equatable {}

/// Event that is dispatched when the DmtNewRegistration widget is first created.
class DmtNewRegistrationInitialEvent extends DmtNewRegistrationEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4SenderRegistration API.
class CreateDmt4SenderRegistrationEvent extends DmtNewRegistrationEvent {
  CreateDmt4SenderRegistrationEvent({
    this.onCreateDmt4SenderRegistrationEventSuccess,
    this.onCreateDmt4SenderRegistrationEventError,
  });

  Function? onCreateDmt4SenderRegistrationEventSuccess;

  Function? onCreateDmt4SenderRegistrationEventError;

  @override
  List<Object?> get props => [
        onCreateDmt4SenderRegistrationEventSuccess,
        onCreateDmt4SenderRegistrationEventError,
      ];
}
