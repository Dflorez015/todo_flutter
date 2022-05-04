import 'package:flutter/material.dart';
import 'package:todo_list/constants/themes.dart';
import 'package:todo_list/models/listProduct.model.dart';
import 'package:todo_list/models/product.model.dart';
import 'package:todo_list/widgets/list.widget.dart';
import '../../widgets/form.widget.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Inventory();
}

class _Inventory extends State<Inventory> {
  var _list = ListProduct();

  TextEditingController task_title_controller = TextEditingController();
  TextEditingController task_description_controller = TextEditingController();
  TextEditingController task_price_controller = TextEditingController();
  TextEditingController task_amount_controller = TextEditingController();

  _clearInputs() {
    task_title_controller.clear();
    task_description_controller.clear();
    task_price_controller.clear();
    task_amount_controller.clear();
  }

  _addList() {
    var product = Product(
      task_title_controller.value.text,
      task_description_controller.value.text,
      int.parse(task_amount_controller.value.text),
      int.parse(task_price_controller.value.text),
    );
    _clearInputs();
    setState(() {
      _list.add(product);
    });
  }

  _openCrud() {
    setState(() {
      _clearInputs();
      // _list = ["a", ..._list];
      formInvetory(
          context,
          false,
          task_title_controller,
          task_description_controller,
          task_price_controller,
          task_amount_controller,
          _addList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(top: 22),
              child: Text("Mi inventario",
                  style: TextStyle(
                    color: text_color,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ))),
          MyList(list: _list)
        ],
      ),
      backgroundColor: main_background_color,
      floatingActionButton: FloatingActionButton(
        onPressed: _openCrud,
        tooltip: 'Agregar artículo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
