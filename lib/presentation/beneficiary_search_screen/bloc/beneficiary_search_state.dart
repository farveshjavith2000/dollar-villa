// ignore_for_file: must_be_immutable

part of 'beneficiary_search_bloc.dart';

/// Represents the state of BeneficiarySearch in the application.
class BeneficiarySearchState extends Equatable {
  BeneficiarySearchState({
    this.searchController,
    this.beneficiarySearchModelObj,
  });

  TextEditingController? searchController;

  BeneficiarySearchModel? beneficiarySearchModelObj;

  @override
  List<Object?> get props => [
        searchController,
        beneficiarySearchModelObj,
      ];
  BeneficiarySearchState copyWith({
    TextEditingController? searchController,
    BeneficiarySearchModel? beneficiarySearchModelObj,
  }) {
    return BeneficiarySearchState(
      searchController: searchController ?? this.searchController,
      beneficiarySearchModelObj:
          beneficiarySearchModelObj ?? this.beneficiarySearchModelObj,
    );
  }
}
