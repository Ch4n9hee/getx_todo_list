import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/core/utils/extension.dart';

class DoingList extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>
        homeController.doingTodos.isEmpty && homeController.doneTodos.isEmpty ?
        Column(
          children: [
            SizedBox(height: 5.0.hp,),
            Image.asset(
              'assets/images/task.png', fit: BoxFit.cover, width: 60.0.wp,),
            SizedBox(height: 5.0.hp,),
            Text('Add Task', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0.sp),),
          ],
        ) : ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ...homeController.doingTodos.map((element) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 9.0.wp),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          fillColor: MaterialStateProperty.resolveWith((
                              states) => Colors.grey),
                          value: element['done'],
                          onChanged: (value) {
                            homeController.doneTodo(element['title'] );
                          },),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                        child: Text(element['title'], overflow: TextOverflow.ellipsis,),
                      ),
                    ],
                  ),
                )).toList(),
            if(homeController.doingTodos.isNotEmpty) Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: const Divider(thickness: 2,),
            )

          ],
        )
    );
  }
}
