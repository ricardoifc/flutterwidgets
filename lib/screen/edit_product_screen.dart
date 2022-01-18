import 'package:flutter/material.dart';
import 'package:flutterwidgets/db/products_database.dart';
import 'package:flutterwidgets/model/product.dart';
import 'package:flutterwidgets/widget/product_form_widget.dart';

class AddEditProductPage extends StatefulWidget {
  final Product? product;

  const AddEditProductPage({
    Key? key,
    this.product,
  }) : super(key: key);
  @override
  _AddEditProductPageState createState() => _AddEditProductPageState();
}

class _AddEditProductPageState extends State<AddEditProductPage> {
  final _formKey = GlobalKey<FormState>();
  //late bool isImportant;
  //late int number;
  late String title;
  late String description;
  late String price;
  late String img;


  @override
  void initState() {
    super.initState();

    //isImportant = widget.product?.isImportant ?? false;
    //number = widget.product?.number ?? 0;
    title = widget.product?.title ?? '';
    description = widget.product?.description ?? '';
    price = widget.product?.price ?? '';
    img = widget.product?.img ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: ProductFormWidget(
        //isImportant: isImportant,
        //number: number,
        title: title,
        description: description,
        //onChangedImportant: (isImportant) =>
        //    setState(() => this.isImportant = isImportant),
        //onChangedNumber: (number) => setState(() => this.number = number),
        onChangedTitle: (title) => setState(() => this.title = title),
        onChangedDescription: (description) =>
            setState(() => this.description = description),
        onChangedPrice: (price) =>
            setState(() => this.price = price),
        onChangedImg: (img) =>
            setState(() => this.img = img),
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.grey,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateProduct,
        child: Text('Guardar'),
      ),
    );
  }

  void addOrUpdateProduct() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.product != null;

      if (isUpdating) {
        await updateProduct();
      } else {
        await addProduct();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateProduct() async {
    final product = widget.product!.copy(
      //isImportant: isImportant,
      //number: number,
      title: title,
      description: description,
        price: price,
        img: img
    );

    await ProductsDatabase.instance.update(product);
  }

  Future addProduct() async {
    final product = Product(
      title: title,
      //isImportant: true,
      //number: number,
      description: description,
      price: price,
      img: img

    );

    await ProductsDatabase.instance.create(product);
  }
}