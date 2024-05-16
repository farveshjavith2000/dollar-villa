import 'package:flutter/material.dart';
import 'package:dollervilla/presentation/veify_login_screen/veify_login_screen.dart';
import 'package:dollervilla/presentation/dmt_verify_screen/dmt_verify_screen.dart';
import 'package:dollervilla/presentation/dmt_fund_transfer_screen/dmt_fund_transfer_screen.dart';
import 'package:dollervilla/presentation/dmt_pin_screen/dmt_pin_screen.dart';
import 'package:dollervilla/presentation/dmt_success_screen/dmt_success_screen.dart';
import 'package:dollervilla/presentation/dmt_failed_screen/dmt_failed_screen.dart';
import 'package:dollervilla/presentation/splash_screen/splash_screen.dart';
import 'package:dollervilla/presentation/login_page_screen/login_page_screen.dart';
import 'package:dollervilla/presentation/dash_board_container_screen/dash_board_container_screen.dart';
import 'package:dollervilla/presentation/create_pin_screen/create_pin_screen.dart';
import 'package:dollervilla/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:dollervilla/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:dollervilla/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:dollervilla/presentation/my_accout_screen/my_accout_screen.dart';
import 'package:dollervilla/presentation/my_account_statements_screen/myaccountstatements_screen.dart';
import 'package:dollervilla/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:dollervilla/presentation/my_accout_screen/my_accout_screen.dart';
import 'package:dollervilla/presentation/wallet_screen/wallet_screen.dart';
import 'package:dollervilla/presentation/notification_screen/notification_screen.dart';
import 'package:dollervilla/presentation/no_internet_screen/no_internet_screen.dart';
import '../presentation/add_beneficiary_screen/add_beneficiary_screen.dart';
import '../presentation/add_money_screen/add_money_screen.dart';
import '../presentation/bbps_screen/bbps_screen.dart';
import '../presentation/beneficiary_search_screen/beneficiary_search_screen.dart';
import '../presentation/broadband_screen/broadband_screen.dart';
import '../presentation/change_password_screen/change_password_screen.dart';
import '../presentation/dmt_new_registration_screen/dmt_new_registration_screen.dart';
import '../presentation/dth_recharge_screen/dth_recharge_screen.dart';
import '../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../presentation/electricity_bill_payment_screen/electricity_bill_payment_screen.dart';
import '../presentation/fastag_screen/fastag_screen.dart';
import '../presentation/forget_password_screen/forget_password_screen.dart';
import '../presentation/gass_bill_payment_screen/gass_bill_payment_screen.dart';
import '../presentation/landline_bill_payment_screen/landline_bill_payment_screen.dart';
import '../presentation/mobile_recharge_screen/mobile_recharge_screen.dart';
import '../presentation/recharge_bill_screen/mobile_postpaid_screen.dart';
import '../presentation/recharge_check_status_screen/recharge_check_status_screen.dart';
import '../presentation/reports_detail_screen/reports_detail_screen.dart';
import '../presentation/reports_screen/reports_screen.dart';
import '../presentation/veify_code_change_pin_screen/veify_code_change_pin_screen.dart';
import '../presentation/verify_email_screen/verify_email_screen.dart';

class AppRoutes {
  static const String veifyLoginScreen = '/veify_login_screen';

  static const String dmtVerifyScreen = '/dmt_verify_screen';

  static const String dmtFundTransferScreen = '/dmt_fund_transfer_screen';

  static const String dmtPinScreen = '/dmt_pin_screen';

  static const String dmtHistoryScreen = '/dmt_history_screen';

  static const String dmtSuccessScreen = '/dmt_success_screen';

  static const String dmtFailedScreen = '/dmt_failed_screen';

  static const String splashScreen = '/splash_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String dashBoardPage = '/dash_board_page';

  static const String dashBoardContainerScreen = '/dash_board_container_screen';

  static const String createPinScreen = '/create_pin_screen';

  static const String contactUsScreen = '/contact_us_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String dmtNewRegistrationScreen =
      '/dmt_new_registratiobn_screen';

  static const String beneficiarySearchScreen = '/beneficiary_search_screen';

  static const String veifyCodeChangePinScreen =
      '/veify_code_change_pin_screen';

  static const String addBeneficiaryScreen = '/add_beneficiary_screen';

  static const String myAccountsScreen = '/my_accounts_screen';

  static const String myAccountStatementsScreen =
      '/my_account_statements_screen';

  static const String myAccoutScreen = '/my_accout_screen';

  static const String walletScreen = '/wallet_screen';

  static const String notificationScreen = '/notification_screen';

  static const String noInternetScreen = '/no_internet_screen';

  static const String reportsDetailScreen = '/reports_detail_screen';

  static const String myAccountStatementsDetailScreen =
      '/myaccountstatements_detail_screen';

  static const String reportsScreen = '/reports_screen';

  static const String broadbandScreen = '/broadband_screen';

  static const String dashBoardContainerPage = '/dash_board_container_page';

  static const String dashBoardContainer1Screen =
      '/dash_board_container1_screen';

  static const String mobileRechargeScreen = '/mobile_recharge_screen';

  static const String electricityBillPaymentScreen =
      '/electricity_bill_payment_screen';

  static const String mobilePostpaidScreen = '/mobile_postpaid_screen';

  static const String dthRechargeScreen = '/dth_recharge_screen';

  static const String landlineBillPaymentScreen =
      '/landline_bill_payment_screen';

  static const String bbpsScreen = '/bbps_screen';

  static const String gassBillPaymentScreen = '/gass_bill_payment_screen';

  static const String fastagScreen = '/fastag_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String verifyEmailScreen = '/verify_email_screen';

  static const String forgetPasswordScreen = '/forget_password_screen';

  static const String addMoneyScreen = '/add_money_screen';
  static const String rechargeCheckStatusScreen =
      '/recharge_check_status_screen';

  static Map<String, WidgetBuilder> get routes => {
        veifyLoginScreen: VeifyLoginScreen.builder,
        dmtVerifyScreen: DmtVerifyScreen.builder,
        dmtFundTransferScreen: DmtFundTransferScreen.builder,
        dmtPinScreen: DmtPinScreen.builder,
        dmtSuccessScreen: DmtSuccessScreen.builder,
        dmtFailedScreen: DmtFailedScreen.builder,
        splashScreen: SplashScreen.builder,
        loginPageScreen: LoginPageScreen.builder,
        dashBoardContainerScreen: DashBoardContainerScreen.builder,
        createPinScreen: CreatePinScreen.builder,
        contactUsScreen: ContactUsScreen.builder,
        privacyPolicyScreen: PrivacyPolicyScreen.builder,
        dmtNewRegistrationScreen: DmtNewRegistrationScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        beneficiarySearchScreen: BeneficiarySearchScreen.builder,
        veifyCodeChangePinScreen: VeifyCodeChangePinScreen.builder,
        addBeneficiaryScreen: AddBeneficiaryScreen.builder,
        broadbandScreen: BroadbandScreen.builder,
        //myAccountsScreen: MyAccountsScreen.builder,
        //myAccountStatementsScreen: MyAccountStatementsScreen.builder,
        myAccountStatementsDetailScreen:
            MyAccountStatementsDetailScreen.builder,
        privacyPolicyScreen: PrivacyPolicyScreen.builder,
        myAccoutScreen: MyAccoutScreen.builder,
        walletScreen: WalletScreen.builder,
        notificationScreen: NotificationScreen.builder,
        noInternetScreen: NoInternetScreen.builder,
        reportsScreen: ReportsScreen.builder,
        reportsDetailScreen: ReportsDetailScreen.builder,
        mobileRechargeScreen: MobileRechargeScreen.builder,
        electricityBillPaymentScreen: ElectricityBillPaymentScreen.builder,
        dthRechargeScreen: DthRechargeScreen.builder,
        landlineBillPaymentScreen: LandlineBillPaymentScreen.builder,
        bbpsScreen: BbpsScreen.builder,
        gassBillPaymentScreen: GassBillPaymentScreen.builder,
        fastagScreen: FastagScreen.builder,
        editProfileScreen: EditProfileScreen.builder,
        changePasswordScreen: ChangePasswordScreen.builder,
        verifyEmailScreen: VerifyEmailScreen.builder,
        forgetPasswordScreen: ForgetPasswordScreen.builder,
        addMoneyScreen: AddMoneyScreen.builder,
        mobilePostpaidScreen: MobilePostpaidScreen.builder,
        rechargeCheckStatusScreen: RechargeCheckStatusScreen.builder,
        initialRoute: SplashScreen.builder,
      };
}
