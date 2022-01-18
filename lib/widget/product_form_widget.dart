import 'package:flutter/material.dart';

class ProductFormWidget extends StatelessWidget {
  //final bool? isImportant;
  //final int? number;
  final String? title;
  final String? description;
  final String? price;
  final String? img;
  //final ValueChanged<bool> onChangedImportant;
  //final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedPrice;
  final ValueChanged<String> onChangedImg;


  const ProductFormWidget({
    Key? key,
    //this.isImportant = false,
    //this.number = 0,
    this.title = '',
    this.description = '',
    this.price = '',
    this.img = '',
    //required this.onChangedImportant,
    //required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedPrice,
    required this.onChangedImg,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 16),
          buildPrice(),
          SizedBox(height: 16),
          buildImg(),
          SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Título',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'El título no debe estar bacio' : null,
    onChanged: onChangedTitle,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: description,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Descrioción de el producto...',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'La descripción no puede estar vacia'
        : null,
    onChanged: onChangedDescription,
  );

  Widget buildPrice() => TextFormField(
    maxLines: 5,
    initialValue: price,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Precio de el producto...',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'El precio no puede estar vacia'
        : null,
    onChanged: onChangedPrice,
  );

  Widget buildImg() => TextFormField(
    maxLines: 5,
    initialValue: img,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'url de la imagen...',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'La imagen no puede estar vacia'
        : null,
    onChanged: onChangedImg,
  );
}