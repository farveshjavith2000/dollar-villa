// ignore_for_file: must_be_immutable

part of 'no_internet_bloc.dart';

/// Represents the state of NoInternet in the application.
class NoInternetState extends Equatable {
  NoInternetState({this.noInternetModelObj});

  NoInternetModel? noInternetModelObj;

  @override
  List<Object?> get props => [
        noInternetModelObj,
      ];
  NoInternetState copyWith({NoInternetModel? noInternetModelObj}) {
    return NoInternetState(
      noInternetModelObj: noInternetModelObj ?? this.noInternetModelObj,
    );
  }
}
