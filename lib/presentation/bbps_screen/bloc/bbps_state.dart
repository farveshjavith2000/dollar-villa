// ignore_for_file: must_be_immutable

part of 'bbps_bloc.dart';

/// Represents the state of Bbps in the application.
class BbpsState extends Equatable {
  BbpsState({
    this.enterNumbervalueController,
    this.emailController,
    this.bbpsModelObj,
  });

  TextEditingController? enterNumbervalueController;

  TextEditingController? emailController;

  BbpsModel? bbpsModelObj;

  @override
  List<Object?> get props => [
        enterNumbervalueController,
        emailController,
        bbpsModelObj,
      ];
  BbpsState copyWith({
    TextEditingController? enterNumbervalueController,
    TextEditingController? emailController,
    BbpsModel? bbpsModelObj,
  }) {
    return BbpsState(
      enterNumbervalueController:
          enterNumbervalueController ?? this.enterNumbervalueController,
      emailController: emailController ?? this.emailController,
      bbpsModelObj: bbpsModelObj ?? this.bbpsModelObj,
    );
  }
}
