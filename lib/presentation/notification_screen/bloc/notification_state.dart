// ignore_for_file: must_be_immutable

part of 'notification_bloc.dart';

/// Represents the state of Notification in the application.
class NotificationState extends Equatable {
  NotificationState({
    this.searchController,
    this.notificationModelObj,
  });

  TextEditingController? searchController;

  NotificationModel? notificationModelObj;

  @override
  List<Object?> get props => [
        searchController,
        notificationModelObj,
      ];
  NotificationState copyWith({
    TextEditingController? searchController,
    NotificationModel? notificationModelObj,
  }) {
    return NotificationState(
      searchController: searchController ?? this.searchController,
      notificationModelObj: notificationModelObj ?? this.notificationModelObj,
    );
  }
}
