// ignore_for_file: must_be_immutable

part of 'add_beneficiary_bloc.dart';

/// Represents the state of AddBeneficiary in the application.
class AddBeneficiaryState extends Equatable {
  AddBeneficiaryState({
    this.nameController,
    this.nameController1,
    this.iFSCCodeController,
    this.enterAccountNumbervalueController,
    this.enterConfirmAccountNumbervalueController,
    this.addBeneficiaryModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? nameController1;

  TextEditingController? iFSCCodeController;

  TextEditingController? enterAccountNumbervalueController;

  TextEditingController? enterConfirmAccountNumbervalueController;

  AddBeneficiaryModel? addBeneficiaryModelObj;

  @override
  List<Object?> get props => [
        nameController,
        nameController1,
        iFSCCodeController,
        enterAccountNumbervalueController,
        enterConfirmAccountNumbervalueController,
        addBeneficiaryModelObj,
      ];
  AddBeneficiaryState copyWith({
    TextEditingController? nameController,
    TextEditingController? nameController1,
    TextEditingController? iFSCCodeController,
    TextEditingController? enterAccountNumbervalueController,
    TextEditingController? enterConfirmAccountNumbervalueController,
    AddBeneficiaryModel? addBeneficiaryModelObj,
  }) {
    return AddBeneficiaryState(
      nameController: nameController ?? this.nameController,
      nameController1: nameController1 ?? this.nameController1,
      iFSCCodeController: iFSCCodeController ?? this.iFSCCodeController,
      enterAccountNumbervalueController: enterAccountNumbervalueController ??
          this.enterAccountNumbervalueController,
      enterConfirmAccountNumbervalueController:
          enterConfirmAccountNumbervalueController ??
              this.enterConfirmAccountNumbervalueController,
      addBeneficiaryModelObj:
          addBeneficiaryModelObj ?? this.addBeneficiaryModelObj,
    );
  }
}
