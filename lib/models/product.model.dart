class Product {
  String? id;
  String name_product;
  String descrition;
  bool? check;
  int cuantity;
  int price;

  Product(this.name_product, this.descrition, this.cuantity, this.price,
      {this.check = true});

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
}
