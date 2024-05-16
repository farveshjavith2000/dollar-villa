// ignore_for_file: must_be_immutable

part of 'contact_us_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ContactUs widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ContactUsEvent extends Equatable {}

/// Event that is dispatched when the ContactUs widget is first created.
class ContactUsInitialEvent extends ContactUsEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Contact API.
class CreateContactEvent extends ContactUsEvent {
  CreateContactEvent({
    this.onCreateContactEventSuccess,
    this.onCreateContactEventError,
  });

  Function? onCreateContactEventSuccess;

  Function? onCreateContactEventError;

  @override
  List<Object?> get props => [
        onCreateContactEventSuccess,
        onCreateContactEventError,
      ];
}
