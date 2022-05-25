import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../providers/products.dart';

import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}




// class ProductsGrid extends StatelessWidget {
//   final bool showOnlyFav;
//   ProductsGrid(this.showOnlyFav);
//   @override
//   Widget build(BuildContext context) {
//     final productsData = Provider.of<Products>(context);
//     final products =
//         showOnlyFav ? productsData.favoriteItems : productsData.items;
//     return GridView.builder(
//         padding: const EdgeInsets.all(10),
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemBuilder: (ctx, itemIndex) {
//           return ChangeNotifierProvider(
//             create: (ctx) => products[itemIndex],
//             child: ProductItem(),
//           );
//         });
//   }
// }
