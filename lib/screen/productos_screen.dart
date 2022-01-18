import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterwidgets/db/products_database.dart';
import 'package:flutterwidgets/model/product.dart';
import 'package:flutterwidgets/screen/edit_product_screen.dart';
import 'package:flutterwidgets/screen/product_detail_screen.dart';
import 'package:flutterwidgets/widget/product_card_widget.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late List<Product> products;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProducts();
  }

  @override
  void dispose() {
    ProductsDatabase.instance.close();

    super.dispose();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);

    this.products = await ProductsDatabase.instance.readAllProducts();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Productos',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : products.isEmpty
          ? Text(
        'No hay Products',
        style: TextStyle(color: Colors.black, fontSize: 24),
      )
          : buildProducts(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.blue,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditProductPage()),
        );

        refreshProducts();
      },
    ),
  );

  Widget buildProducts() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: products.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final product = products[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: product.id!),
          ));

          refreshProducts();
        },
        child: ProductCardWidget(product: product, index: index),
      );
    },
  );
}