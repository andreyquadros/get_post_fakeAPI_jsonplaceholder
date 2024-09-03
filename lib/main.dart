import 'package:flutter/material.dart';
import 'package:jsonplaceholder_fake/routes/app_routes.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   routes: AppRoutes.define(),
    initialRoute: AppRoutes.initial_page,
  ));
}