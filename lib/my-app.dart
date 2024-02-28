import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled107/View/Views-second-page.dart';

import 'Views/View-page-one.dart';

import 'bindings-page-one.dart';
import 'bindings-page-two.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => PageOneView(), binding: PageOneBinding()),
        GetPage(name: '/second_page', page: () =>  PageTwoView(),binding: PageTwoBinding()),
      ],
    );
  }
}
