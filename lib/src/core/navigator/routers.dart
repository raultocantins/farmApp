import 'package:farm_app/src/features/autentication/presenter/pages/authentication_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/register_farm_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/register_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/login_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/reset_password_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/reset_pass_success_page.dart';
import 'package:farm_app/src/features/autentication/presenter/pages/verify_email_page.dart';
import 'package:farm_app/src/features/equipment/presenter/equipment_page.dart';
import 'package:farm_app/src/features/financialservices/presenter/financial_service_page.dart';
import 'package:farm_app/src/features/home/presenter/page/home_page.dart';
import 'package:farm_app/src/features/myfarm/presenter/farm_main_page.dart';
import 'package:farm_app/src/features/myfarm/presenter/farms.dart';
import 'package:farm_app/src/features/weather/presenter/weather_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routers = {
  '/home': (context) => const HomePage(),
  '/authentication': (context) => const MainLogin(),
  '/register': (context) => const RegisterPage(),
  '/login': (context) => const LoginPage(),
  '/myfarm': (context) => const MyFarmPage(),
  '/financialservices': (context) => const FinancialServicePage(),
  '/equipment': (context) => const EquipmentPage(),
  '/weather': (context) => const WeatherPage(),
  '/farmmain': (context) => const FarmMainPage(),
  '/registerfarm': (context) => const RegisterFarm(),
  '/resetpassword': (context) => const ResetPassword(),
  '/resetpassconfirm': (context) => const ResetPassSuccess(),
  '/verifyemail': (context) => const VerifyEmail()
};
