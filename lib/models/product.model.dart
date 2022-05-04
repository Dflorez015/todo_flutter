class Product {
  String? id;
  String name_product;
  String descrition;
  bool? check;
  int cuantity;
  int price;

  Product(this.name_product, this.descrition, this.cuantity, this.price,
      {this.check = false});

  get() {
    return {
      "id": this.id,
      "name_product": this.name_product,
      "descrition": this.descrition,
      "check": this.check,
      "cuantity": this.cuantity,
      "price": this.price,
    };
  }

  setId(String id) {
    this.id = id;
  }

  setCheck(bool check) {
    this.check = check;
  }

  setValue(
      String? name_product, String? descrition, int? cuantity, int? price) {
    this.name_product = name_product ?? this.name_product;
    this.descrition = descrition ?? this.descrition;
    this.cuantity = cuantity ?? this.cuantity;
    this.price = price ?? this.price;
  }
}
