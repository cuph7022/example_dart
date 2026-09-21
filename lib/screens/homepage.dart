import 'package:flutter/material.dart';

import '../data/models/product.dart';
import '../widgets/product_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    const product = Product(
      id: 1,
      name: 'Chikawa',
      image: 'assets/images/images.jpg',
      price: 20,
      description: 'This is a cute Chikawa product.',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Homepage'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: ProductWidget(product: product),
      ),
    );
  }
}