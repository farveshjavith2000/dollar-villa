// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [electricity_bill_payment_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ElectricityBillPaymentModel extends Equatable {
  ElectricityBillPaymentModel() {}

  ElectricityBillPaymentModel copyWith() {
    return ElectricityBillPaymentModel();
  }

  @override
  List<Object?> get props => [];
}
