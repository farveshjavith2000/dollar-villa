// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofilesection_item_model.dart';

/// This class defines the variables used in the [beneficiary_search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BeneficiarySearchModel extends Equatable {
  BeneficiarySearchModel({this.userprofilesectionItemList = const []}) {}

  List<UserprofilesectionItemModel> userprofilesectionItemList;

  BeneficiarySearchModel copyWith(
      {List<UserprofilesectionItemModel>? userprofilesectionItemList}) {
    return BeneficiarySearchModel(
      userprofilesectionItemList:
          userprofilesectionItemList ?? this.userprofilesectionItemList,
    );
  }

  @override
  List<Object?> get props => [userprofilesectionItemList];
}
