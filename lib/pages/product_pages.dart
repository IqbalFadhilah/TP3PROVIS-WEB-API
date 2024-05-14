import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product_provider.dart';

class ProductPages extends StatelessWidget {
const ProductPages({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).fetchProducts(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<ProductProvider>(
                    builder: (ctx, productProvider, _) => ListView.builder(
                      itemCount: productProvider.products.length,
                      itemBuilder: (ctx, i) => ListTile(
                        leading: Image.network(productProvider.products[i].image),
                        title: Text(productProvider.products[i].title),
                        subtitle: Text(productProvider.products[i].description),
                      ),
                    ),
                  ),
      ),
    );
  }
}