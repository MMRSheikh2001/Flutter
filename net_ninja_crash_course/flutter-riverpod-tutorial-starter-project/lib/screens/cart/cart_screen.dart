import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartsProduct = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartsProduct.map((p){
                    return Container(
                     padding: const EdgeInsets.only(top :10, bottom: 10),
                      child: Row(
                        children: [
                          Image.asset(p.image,width: 60,height: 60,),
                          const SizedBox(width: 20,),
                          Text(p.title),
                          const SizedBox(width: 20,),
                          Text('\$ ${p.price}')
                        ],

                    )
                    );
              }).toList()
            ),


          ],
        ),
      ),
    );
  }
}