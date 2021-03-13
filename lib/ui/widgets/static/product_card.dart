import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/core/model/responses/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  Color hexToColor(String color) {
    return new Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  ProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: hexToColor(product.color),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 80.0,
        child: Center(
          child: Text(
            product.name,
            style: TextStyle(
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
