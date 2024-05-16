// ignore_for_file: must_be_immutable

part of 'veify_login_bloc.dart';

/// Represents the state of VeifyLogin in the application.
class VeifyLoginState extends Equatable {
  VeifyLoginState({
    this.editTextController,
    this.veifyLoginModelObj,
  });

  TextEditingController? editTextController;

  VeifyLoginModel? veifyLoginModelObj;

  @override
  List<Object?> get props => [
        editTextController,
        veifyLoginModelObj,
      ];
  VeifyLoginState copyWith({
    TextEditingController? editTextController,
    VeifyLoginModel? veifyLoginModelObj,
  }) {
    return VeifyLoginState(
      editTextController: editTextController ?? this.editTextController,
      veifyLoginModelObj: veifyLoginModelObj ?? this.veifyLoginModelObj,
    );
  }
}
