import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';

class BuildTaskDoneItem extends  StatelessWidget {
   BuildTaskDoneItem(this.models,{Key? key}) ;
  Map models;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
  }
}
