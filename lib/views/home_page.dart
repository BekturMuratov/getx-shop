import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_shop/controllers/productcontroller.dart';
import 'package:getx_shop/views/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController product_controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'ShopX',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.view_list_rounded), onPressed: () {}),
              IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
              if (product_controller.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: product_controller.productList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return ProductTile(product_controller.productList[index]);
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1)
              );
              }
              ),
            )
      ]),
    );
  }
}
