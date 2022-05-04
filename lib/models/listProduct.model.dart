import 'package:todo_list/models/product.model.dart';

class ListProduct {
  List<Product>? list = [];

  ListProduct();

  add(Product product) {
    list?.add(product);
  }

  length() {
    return list?.length;
  }

  getByIndex(int index) {
    return list?[index];
  }
}
