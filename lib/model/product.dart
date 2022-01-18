final String tableProducts = 'products';

class ProductFields {
  static final List<String> values = [
    /// Add all fields
    id,
    //isImportant, number,
    title, description, price, img
  ];

  static final String id = '_id';
  //static final String isImportant = 'isImportant';
  //static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String price = 'price';
  static final String img = 'img';
}

class Product {
  final int? id;
  //final bool isImportant;
  //final int number;
  final String title;
  final String description;
  final String price;
  final String img;

  const Product({
    this.id,
    //required this.isImportant,
    //required this.number,
    required this.title,
    required this.description,
    required this.price,
    required this.img,
  });

  Product copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    String? price,
    String? img,
  }) =>
      Product(
        id: id ?? this.id,
        //isImportant: isImportant ?? this.isImportant,
        //number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        img: img ?? this.img,
      );

  static Product fromJson(Map<String, Object?> json) => Product(
    id: json[ProductFields.id] as int?,
    //isImportant: json[ProductFields.isImportant] == 1,
    //number: json[ProductFields.number] as int,
    title: json[ProductFields.title] as String,
    description: json[ProductFields.description] as String,
    price: json[ProductFields.price] as String,
    img: json[ProductFields.img] as String,
  );

  Map<String, Object?> toJson() => {
    ProductFields.id: id,
    ProductFields.title: title,
    //ProductFields.isImportant: isImportant ? 1 : 0,
    //ProductFields.number: number,
    ProductFields.description: description,
    ProductFields.price: price,
    ProductFields.img: img,
  };
}