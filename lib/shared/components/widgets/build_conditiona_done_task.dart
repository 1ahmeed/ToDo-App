import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'build_task_done_item.dart';

class BuildConditionDoneTask  extends StatelessWidget {
   BuildConditionDoneTask({Key? key,
   required this.tasks,
   });
    List<Map<dynamic, dynamic>>? tasks;
  @override
  Widget build(BuildContext context) {
    return  ConditionalBuilder(
      condition: tasks!.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => BuildTaskDoneItem(
          tasks![index],
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks!.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              color: Colors.grey,
              size: 100,
            ),
            Text(
              "No Tasks Yet, Please Add Some Tasks",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
