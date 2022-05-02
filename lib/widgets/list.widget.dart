import 'package:flutter/material.dart';
import 'package:todo_list/constants/themes.dart';

class MyList extends StatefulWidget {
  MyList({Key? key, required this.list}) : super(key: key);
  List<String> list;

  @override
  State<StatefulWidget> createState() => _InventoryList();
}

class _InventoryList extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .65,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          itemCount: widget.list.length,
          itemBuilder: (BuildContext build_context, int index) {
            final task = widget.list[index];
            return TaskInventory(task: task);
          }),
    );
  }
}

class TaskInventory extends StatelessWidget {
  const TaskInventory({Key? key, required this.task}) : super(key: key);
  final String task;
  @override
  Widget build(BuildContext context) {
    return (Card(
      color: second_color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
          title: Text(task,
              style: const TextStyle(color: text_color, fontSize: 22))),
    ));
  }
}
