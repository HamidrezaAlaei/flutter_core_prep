import 'package:flutter/material.dart';

class DecoratedImageBoxLogo extends StatelessWidget {
  const DecoratedImageBoxLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/logo.jpg',
        height: 300.0,
      ),
    );
  }
}
