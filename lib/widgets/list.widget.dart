import 'package:flutter/material.dart';
import 'package:todo_list/constants/themes.dart';
import 'package:todo_list/models/listProduct.model.dart';
import 'package:todo_list/models/product.model.dart';

class MyList extends StatefulWidget {
  MyList({Key? key, required this.list}) : super(key: key);
  ListProduct list;

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
          itemCount: widget.list.length(),
          itemBuilder: (BuildContext build_context, int index) {
            final task = widget.list.getByIndex(index);
            return TaskInventory(task: task);
          }),
    );
  }
}

class TaskInventory extends StatefulWidget {
  const TaskInventory({Key? key, required this.task}) : super(key: key);
  final Product task;

  @override
  State<TaskInventory> createState() => _TaskInventoryState();
}

class _TaskInventoryState extends State<TaskInventory> {
  _setCheck(Product product, bool check) {
    setState(() {
      product.setCheck(check);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return (Card(
        color: second_color,
        shape: shape_main,
        child: Theme(
          data: theme.copyWith(checkboxTheme: circularCheckBorder(theme)),
          child: CheckboxListTile(
            title: Text(widget.task.name_product,
                style: const TextStyle(
                    color: text_color,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            subtitle: Text(widget.task.descrition,
                style: const TextStyle(color: text_color, fontSize: 12)),
            value: widget.task.check,
            onChanged: (newValue) => {_setCheck(widget.task, newValue!)},
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: text_color,
            checkColor: main_background_color,
            side: const BorderSide(color: text_color),
            shape: shape_main,
          ),
        )));
  }
}
