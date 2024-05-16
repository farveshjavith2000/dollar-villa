// ignore_for_file: must_be_immutable

part of 'privacy_policy_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrivacyPolicy widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PrivacyPolicyEvent extends Equatable {}

/// Event that is dispatched when the PrivacyPolicy widget is first created.
class PrivacyPolicyInitialEvent extends PrivacyPolicyEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Privacy API.
class CreatePrivacyEvent extends PrivacyPolicyEvent {
  CreatePrivacyEvent({this.onCreatePrivacyEventError});

  Function? onCreatePrivacyEventError;

  @override
  List<Object?> get props => [
        onCreatePrivacyEventError,
      ];
}
