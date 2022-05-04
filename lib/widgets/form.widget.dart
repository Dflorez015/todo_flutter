import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/utils/validate.input.dart';
import '../constants/themes.dart';

Future<dynamic> formInvetory(
    BuildContext context,
    bool updating,
    TextEditingController task_title_controller,
    TextEditingController task_description_controller,
    TextEditingController task_price_controller,
    TextEditingController task_amount_controller,
    Function adding) {
  final _form = GlobalKey<FormState>();

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    Navigator.of(context).pop();
    adding();
  }

  return showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      context: context,
      builder: (BuildContext builder) {
        return Form(
          key: _form, //assigning key to form
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  (updating ? "Actualizando producto" : "Agregar producto"),
                  style: const TextStyle(
                      color: second_color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  enableSuggestions: true,
                  autofocus: true,
                  controller: task_title_controller,
                  validator: (value) {
                    return validate_input(value, "Ingrese un título");
                  },
                  decoration: InputDecoration(
                      labelText: "Título",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: inputBorder)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  enableSuggestions: true,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  controller: task_description_controller,
                  validator: (value) {
                    return validate_input(value, "Ingrese una descripción");
                  },
                  decoration: InputDecoration(
                      labelText: "Descripción",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: inputBorder)),
                ),
                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        enableSuggestions: true,
                        controller: task_amount_controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          return validate_input(
                              value, "Ingrese la cantidad del producto");
                        },
                        decoration: InputDecoration(
                            labelText: "Cantidad",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: inputBorder)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        enableSuggestions: true,
                        controller: task_price_controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          return validate_input(
                              value, "Ingrese el valor del producto");
                        },
                        decoration: InputDecoration(
                            labelText: "Precio",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: inputBorder)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              main_background_color)),
                      onPressed: () => {
                            _saveForm() /*Navigator.of(context).pop(), adding()*/
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((updating ? "Actualizar" : "Guardar"),
                            style: const TextStyle(fontSize: 16)),
                      )),
                )
                // MaterialButton()
              ],
            ),
          ),
        );
      });
}
