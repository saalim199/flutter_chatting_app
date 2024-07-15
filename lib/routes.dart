import 'package:chatting_app/screens/home_page.dart';
import 'package:chatting_app/screens/login_page.dart';
import 'package:chatting_app/screens/register_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String loginPage = '/login';
  static String registerPage = '/register';
  static String homePage = '/home';
}

final getPages = [
  GetPage(name: Routes.loginPage, page: () => LoginPage()),
  GetPage(name: Routes.registerPage, page: () => const RegisterPage()),
  GetPage(name: Routes.homePage, page: () => HomePage()),
];
