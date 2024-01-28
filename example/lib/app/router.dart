import 'package:get/get.dart';

import '../modules/home/home_view.dart';

class AppRoutes {
  static final routes = [
    // 网站首页
    GetPage(
      name: HomeView.url,
      page: () => const HomeView(),
    ),
  ];
}
