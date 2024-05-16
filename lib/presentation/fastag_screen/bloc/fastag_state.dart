// ignore_for_file: must_be_immutable

part of 'fastag_bloc.dart';

/// Represents the state of Fastag in the application.
class FastagState extends Equatable {
  FastagState({
    this.vehicleNumbervalueController,
    this.selectedDropDownValue,
    this.fastagModelObj,
  });

  TextEditingController? vehicleNumbervalueController;

  SelectionPopupModel? selectedDropDownValue;

  FastagModel? fastagModelObj;

  @override
  List<Object?> get props => [
        vehicleNumbervalueController,
        selectedDropDownValue,
        fastagModelObj,
      ];
  FastagState copyWith({
    TextEditingController? vehicleNumbervalueController,
    SelectionPopupModel? selectedDropDownValue,
    FastagModel? fastagModelObj,
  }) {
    return FastagState(
      vehicleNumbervalueController:
          vehicleNumbervalueController ?? this.vehicleNumbervalueController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      fastagModelObj: fastagModelObj ?? this.fastagModelObj,
    );
  }
}
