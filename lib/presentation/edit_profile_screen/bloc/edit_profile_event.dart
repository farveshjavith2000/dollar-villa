// ignore_for_file: must_be_immutable

part of 'edit_profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditProfile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditProfileEvent extends Equatable {}

/// Event that is dispatched when the EditProfile widget is first created.
class EditProfileInitialEvent extends EditProfileEvent {
  @override
  List<Object?> get props => [];
}
