import 'package:baitapbuoi6/ListTileCustom.dart';
import 'package:baitapbuoi6/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'add_product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProduct()),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView.separated(
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
          ),
        ),
      ),
    );
  }
}
