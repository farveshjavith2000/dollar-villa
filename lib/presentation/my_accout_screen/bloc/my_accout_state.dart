// ignore_for_file: must_be_immutable

part of 'my_accout_bloc.dart';

/// Represents the state of MyAccout in the application.
class MyAccoutState extends Equatable {
  MyAccoutState({this.myAccoutModelObj});

  MyAccoutModel? myAccoutModelObj;

  @override
  List<Object?> get props => [
        myAccoutModelObj,
      ];
  MyAccoutState copyWith({MyAccoutModel? myAccoutModelObj}) {
    return MyAccoutState(
      myAccoutModelObj: myAccoutModelObj ?? this.myAccoutModelObj,
    );
  }
}
