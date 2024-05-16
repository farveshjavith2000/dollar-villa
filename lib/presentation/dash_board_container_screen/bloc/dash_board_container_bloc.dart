import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/models/getWalletBalance/post_get_wallet_balance_req.dart';
import '../../../data/models/getWalletBalance/post_get_wallet_balance_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/dash_board_container_model.dart';
import '/core/app_export.dart';
import '../models/dashboardcontainer_item_model.dart';

import 'dart:async';

part 'dash_board_container_event.dart';
part 'dash_board_container_state.dart';

/// A bloc that manages the state of a DashBoardContainer according to the event that is dispatched to it.
class DashBoardContainerBloc
    extends Bloc<DashBoardContainerEvent, DashBoardContainerState> {
  DashBoardContainerBloc(DashBoardContainerState initialState)
      : super(initialState) {
    on<DashBoardContainerInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
    on<CreateWalletBalanceEvent>(_callGetWalletBalance);
  }

  final _repository = Repository();

  var postGetWalletBalanceResp = PostGetWalletBalanceResp();

  _changeRadioButton(
      ChangeRadioButtonEvent event,
      Emitter<DashBoardContainerState> emit,
      ) {
    emit(state.copyWith(radioGroup: event.value));
  }

  List<DashboardcontainerItemModel> fillDashboardcontainerItemList() {
    return [
      DashboardcontainerItemModel(
          landline: ImageConstant.imgFrame28, landline1: "Landline "),
      DashboardcontainerItemModel(
          landline: ImageConstant.imgAirplane, landline1: "Electric "),
      DashboardcontainerItemModel(
          landline: ImageConstant.imgFastagLogo1, landline1: "Fastag"),
      DashboardcontainerItemModel(landline1: "Mobile "),
      DashboardcontainerItemModel(landline1: "DTH"),
      DashboardcontainerItemModel(landline1: "Broadband"),
      DashboardcontainerItemModel(landline1: "Gass"),
      DashboardcontainerItemModel(landline1: "BBPS")
    ];
  }

  /// Calls the https://app.victoriaepay.com/WalletBalance API and triggers a [CreateWalletBalanceEvent] event on the [DashBoardContainerBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
      DashBoardContainerInitialEvent event,
      Emitter<DashBoardContainerState> emit,
      ) async {
    emit(state.copyWith(radioGroup: ""));
    emit(state.copyWith(
        dashBoardContainerModelObj: state.dashBoardContainerModelObj?.copyWith(
            dashboardcontainerItemList: fillDashboardcontainerItemList())));
    add(
      CreateWalletBalanceEvent(),
    );
  }

  /// Calls [https://app.victoriaepay.com/WalletBalance] with the provided event and emits the state.
  ///
  /// The [CreateWalletBalanceEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGetWalletBalance(
      CreateWalletBalanceEvent event,
      Emitter<DashBoardContainerState> emit,
      ) async {
    var postGetWalletBalanceReq = PostGetWalletBalanceReq(
      memid: PrefUtils().getMemIdForUserLoggedIn().toString(),
    );
    await _repository.getWalletBalance(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postGetWalletBalanceReq.toJson(),
    ).then((value) async {
      postGetWalletBalanceResp = value;
      _onGetWalletBalanceSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onGetWalletBalanceError();
    });
  }

  void _onGetWalletBalanceSuccess(
      PostGetWalletBalanceResp resp,
      Emitter<DashBoardContainerState> emit,
      ) {
    emit(
      state.copyWith(
        dashBoardContainerModelObj: state.dashBoardContainerModelObj?.copyWith(
          price: resp.walletBalance ?? '',
        ),
      ),
    );
  }

  void _onGetWalletBalanceError() {
    //implement error method body...
  }
}
