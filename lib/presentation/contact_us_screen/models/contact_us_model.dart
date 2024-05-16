// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [contact_us_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ContactUsModel extends Equatable {
  ContactUsModel({
    this.widget = "",
    this.email = "",
    this.description = "",
    this.weburl = "",
  }) {}

  String widget;

  String email;

  String description;

  String weburl;

  ContactUsModel copyWith({
    String? widget,
    String? email,
    String? description,
    String? weburl,
  }) {
    return ContactUsModel(
      widget: widget ?? this.widget,
      email: email ?? this.email,
      description: description ?? this.description,
      weburl: weburl ?? this.weburl,
    );
  }

  @override
  List<Object?> get props => [widget, email, description, weburl];
}
