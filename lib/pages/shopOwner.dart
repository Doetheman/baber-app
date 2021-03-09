import 'package:flutter/material.dart';

class ShopOwner extends StatefulWidget {
  @override
  _ShopOwnerState createState() => _ShopOwnerState();
}

class _ShopOwnerState extends State<ShopOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shop Owner'),
      ),
    );
  }
}
