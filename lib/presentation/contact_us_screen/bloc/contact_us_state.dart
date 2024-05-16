// ignore_for_file: must_be_immutable

part of 'contact_us_bloc.dart';

/// Represents the state of ContactUs in the application.
class ContactUsState extends Equatable {
  ContactUsState({this.contactUsModelObj});

  ContactUsModel? contactUsModelObj;

  @override
  List<Object?> get props => [
        contactUsModelObj,
      ];
  ContactUsState copyWith({ContactUsModel? contactUsModelObj}) {
    return ContactUsState(
      contactUsModelObj: contactUsModelObj ?? this.contactUsModelObj,
    );
  }
}
