// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [dash_board_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashBoardModel extends Equatable {
  DashBoardModel() {}

  DashBoardModel copyWith() {
    return DashBoardModel();
  }

  @override
  List<Object?> get props => [];
}
