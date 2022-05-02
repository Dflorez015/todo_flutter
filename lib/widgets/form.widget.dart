import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/themes.dart';

Future<dynamic> formInvetory(
  BuildContext context,
  bool updating,
  TextEditingController task_title_controller,
  TextEditingController task_description_controller,
  TextEditingController task_price_controller,
  TextEditingController task_amount_controller,
) {
  return showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
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
              TextField(
                enableSuggestions: true,
                autofocus: true,
                controller: task_title_controller,
                decoration: InputDecoration(
                    labelText: "Título",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: inputBorder)),
              ),
              const SizedBox(height: 15),
              TextField(
                enableSuggestions: true,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                controller: task_description_controller,
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
                    child: TextField(
                      textAlign: TextAlign.center,
                      enableSuggestions: true,
                      controller: task_amount_controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    child: TextField(
                      enableSuggestions: true,
                      controller: task_price_controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          labelText: "Precio",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: inputBorder)),
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () => {},
                  child: Text((updating ? "Actualizar" : "Guardar")))
              // MaterialButton()
            ],
          ),
        );
      });
}
