import 'package:flutter/material.dart';
import 'package:flutterwidgets/db/products_database.dart';
import 'package:flutterwidgets/model/product.dart';
import 'package:flutterwidgets/screen/edit_product_screen.dart';


class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product product;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProduct();
  }

  Future refreshProduct() async {
    setState(() => isLoading = true);

    this.product = await ProductsDatabase.instance.readProduct(widget.productId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            product.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

          ),
          SizedBox(height: 8),

          /*
          Text(
            DateFormat.yMMMd().format(note.createdTime),
            style: TextStyle(color: Colors.white38),
          ),

           */
          SizedBox(height: 8),
          Text(
            product.description,
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    ),
  );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditProductPage(product: product),
        ));

        refreshProduct();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await ProductsDatabase.instance.delete(widget.productId);

      Navigator.of(context).pop();
    },
  );
}