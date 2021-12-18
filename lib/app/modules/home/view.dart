import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/core/utils/extension.dart';

class HomePage extends GetView<HomeController> {
  const  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Text('My List', style: TextStyle(fontSize: 24.0.sp),),
          ],
        ),
      ),
    );
  }
}
