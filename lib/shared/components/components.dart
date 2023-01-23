import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget defaultButton({
  double wide = double.infinity,
  Color background = Colors.deepPurple,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: wide,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required String? Function(String?)? validate,
  void Function(String)? onSubmit,
  void Function(String)? onchange,
  void Function()? onTap,
  required String label,
  bool isClickable = true,
  required IconData? prefixIcon,
  void Function()? suffixPressed,
  IconData? suffixIcon,
  bool isPassword = false,
  Color colorIcon = Colors.deepPurple,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      cursorColor: Colors.teal,
      validator: validate,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.teal),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green)),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget buildTasksItem(Map models, context) => Dismissible(
      key: Key(models['id'].toString()),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.teal,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding:const  EdgeInsets.symmetric(horizontal: 20),
        color: Colors.teal,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context)?.deleteData(id: models['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child:Text("${models['time']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${models['title']}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${models['date']}",
                    style:  Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "done", id: models['id']);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.teal,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "archived", id: models['id']);
                },
                icon: const Icon(
                  Icons.archive_outlined,
                  color: Colors.teal,
                ))
          ],
        ),
      ),
    );

Widget buildTasksDoneItem(Map models, context) => Dismissible(
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.teal,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.teal,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      key: Key(models['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context)?.deleteData(id: models['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child: Text("${models['time']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${models['title']}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${models['date']}",
                    style:  Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      ?.updateData(status: "done", id: models['id']);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.teal,
                )),
          ],
        ),
      ),
    );

Widget buildConditionalDoneBuilder({
  required List<Map<dynamic, dynamic>>? tasks,
}) =>
    ConditionalBuilder(
      condition: tasks!.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => buildTasksDoneItem(
          tasks[index],
          context,
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks.length,
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

Widget buildConditionalBuilder({
  required List<Map<dynamic, dynamic>>? tasks,
}) =>
    ConditionalBuilder(
      condition: tasks!.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => buildTasksItem(
          tasks[index],
          context,
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks.length,
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
