import 'package:baitapbuoi6/edit_product.dart';
import 'package:baitapbuoi6/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  ProductModel productModel;
  ListTileCustom({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToEditPage(context);
      },
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                productModel.imageURL,
              ),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Text(productModel.title),
          ),
          InkWell(
            onTap: () {
              _goToEditPage(context);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.purple,
            ),
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.business,
              color: Colors.green,
            ),
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }

  void _goToEditPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EditProduct(productModel: productModel)),
    );
  }
}
