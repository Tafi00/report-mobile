import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_binding.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_page.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_binding.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_page.dart';
import 'package:report_azvidi/app/modules/extend/extend_page.dart';
import 'package:report_azvidi/app/modules/login/login_binding.dart';
import 'package:report_azvidi/app/modules/main/main_binding.dart';
import 'package:report_azvidi/app/modules/main/main_page.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_binding.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_page.dart';
import 'package:report_azvidi/app/modules/manage_user/manage_user_binding.dart';
import 'package:report_azvidi/app/modules/manage_user/manage_user_page.dart';
import 'package:report_azvidi/app/modules/notify/notify_page.dart';
import 'package:report_azvidi/app/modules/otp/otp_binding.dart';
import 'package:report_azvidi/app/modules/otp/otp_page.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_binding.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_page.dart';
import '../modules/customer/customer_page.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpPage(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.customer,
      page: () => const CustomerPage(),
    ),
    GetPage(
      name: AppRoutes.detailCustomer,
      page: () => const DetailCustomerPage(),
      binding: DetailCustomerBinding(),
    ),
    GetPage(
      name: AppRoutes.detailPlan,
      page: () => const DetailPlanPage(),
      binding: DetailPlanBinding(),
    ),
    GetPage(
      name: AppRoutes.extend,
      page: () => const ExtendPage(),
    ),
    GetPage(
      name: AppRoutes.rateCards,
      page: () => const RateCardsPage(),
      binding: RateCardsBinding(),
    ),
    GetPage(
      name: AppRoutes.manageAccount,
      page: () => const ManageAccountPage(),
      binding: ManageAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.manageUser,
      page: () => const ManageUserPage(),
      binding: ManageUserBinding(),
    ),
    GetPage(
      name: AppRoutes.notify,
      page: () => const NotifyPage(),
    ),
  ];
}
