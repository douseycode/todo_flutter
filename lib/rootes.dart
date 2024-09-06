import 'package:get/route_manager.dart';
import 'package:todo/ecrans/auth/login.dart';
import 'package:todo/ecrans/auth/register.dart';
import 'package:todo/ecrans/home/home.dart';

class GetRoutes{

  static const String login = "/login";
  static const String register= "/register";
  static const String home = "/home";

  static  List<GetPage> routes = [
    GetPage(
      name: GetRoutes.login,
      page: () =>  LoginPage(),
    ),
    GetPage(
      name: GetRoutes.register,
      page: () =>  RegisterPage(),
    ),
    GetPage(
      name: GetRoutes.home,
      page: () =>  HomePage(),
    ),
  ];
}