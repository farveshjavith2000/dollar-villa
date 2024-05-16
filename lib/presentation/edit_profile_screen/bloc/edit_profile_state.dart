// ignore_for_file: must_be_immutable

part of 'edit_profile_bloc.dart';

/// Represents the state of EditProfile in the application.
class EditProfileState extends Equatable {
  EditProfileState({
    this.nameController,
    this.emailController,
    this.phoneNumberController,
    this.editProfileModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? phoneNumberController;

  EditProfileModel? editProfileModelObj;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        phoneNumberController,
        editProfileModelObj,
      ];
  EditProfileState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? phoneNumberController,
    EditProfileModel? editProfileModelObj,
  }) {
    return EditProfileState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      editProfileModelObj: editProfileModelObj ?? this.editProfileModelObj,
    );
  }
}
