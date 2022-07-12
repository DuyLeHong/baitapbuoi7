import 'package:baitapbuoi6/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'add_product.dart';
import 'edit_product.dart';
import 'list_tile_custom.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => productListState;
}

_ProductListState productListState = _ProductListState();

List<ProductModel> productList = <ProductModel>[
  ProductModel('Product 1', 100.0, 'Ok',
      'https://image.thanhnien.vn/w660/Uploaded/2022/jvunzvu/2021_06_04/diec-lua_fsdb_vsni.jpg'),
  ProductModel('Product 2', 90.0, 'Ok',
      'https://media.vov.vn/uploaded/4bpdy3ykolq/2020_01_13/a2_nqng.jpg'),
  ProductModel('Product 3', 80.0, 'Ok',
      'https://daohieu.com/wp-content/uploads/2020/05/chim-vang-anh-917x1024.jpg'),
  ProductModel('Product 4', 95.0, 'Ok',
      'https://e.khoahoc.tv/photos/image/2020/04/23/chim-Bearded-Reedling.jpg'),
];

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProduct()),
                );

                if (result != null) {
                  setState(() {
                    ProductModel newProduct = result as ProductModel;
                    productList.add(newProduct);
                  });
                }
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {

            print('MaxWidth: ${constraints.maxWidth}');

            if (constraints.maxWidth > 600) {
              return _buildWideContainers();
            } else {
              return _buildNormalContainer();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildWideContainers() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: productList.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTileCustom(
        productModel: productList[index],
      );
    },
  );
}

Widget _buildNormalContainer() {
  return ListView.separated(
    // shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    itemCount: productList.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTileCustom(
        productModel: productList[index],
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(
      thickness: 1,
      color: Colors.black12,
      indent: 10,
      endIndent: 10,
    ),
  );
}
