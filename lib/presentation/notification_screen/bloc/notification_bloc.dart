import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofilelist_item_model.dart';
import 'package:dollervilla/presentation/notification_screen/models/notification_model.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// A bloc that manages the state of a Notification according to the event that is dispatched to it.
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationState initialState) : super(initialState) {
    on<NotificationInitialEvent>(_onInitialize);
  }

  List<UserprofilelistItemModel> fillUserprofilelistItemList() {
    return [
      UserprofilelistItemModel(
          userName: "SS",
          marketName: "SS Market",
          sentCount: "5,500 sent",
          date: "15/09/23 ",
          time: "08:25 am"),
      UserprofilelistItemModel(
          userName: "DS",
          marketName: "DS Market",
          sentCount: "7,500 sent",
          date: "15/09/23 ",
          time: "10:05 am"),
      UserprofilelistItemModel(
          userName: "SS",
          marketName: "DS Market",
          sentCount: "500 Failed",
          date: "15/09/23 ",
          time: "12:30 pm")
    ];
  }

  _onInitialize(
    NotificationInitialEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        notificationModelObj: state.notificationModelObj?.copyWith(
            userprofilelistItemList: fillUserprofilelistItemList())));
  }
}
