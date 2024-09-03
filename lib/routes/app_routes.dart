import 'package:flutter/cupertino.dart';
import 'package:jsonplaceholder_fake/views/get_page.dart';
import 'package:jsonplaceholder_fake/views/initial_page.dart';
import 'package:jsonplaceholder_fake/views/post_page.dart';

class AppRoutes{
  static const initial_page = '/initial_page';
  static const get_page = '/get_page';
  static const post_page = '/post_page';

  static Map<String, WidgetBuilder> define(){
    return {
      get_page: (BuildContext context) => GetPage(),
      initial_page: (BuildContext context) => InitialPage(),
      post_page: (BuildContext context) => PostPage(),
    };
  }

}