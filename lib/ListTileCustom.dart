import 'package:baitapbuoi6/edit_product.dart';
import 'package:baitapbuoi6/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  ProductModel productModel;
  ListTileCustom({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Text(productModel.title),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditProduct(productModel: productModel)),
            );
          },
          child: const Icon(
            Icons.edit,
            color: Colors.purple,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.calendar_today_rounded,
            color: Colors.green,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
