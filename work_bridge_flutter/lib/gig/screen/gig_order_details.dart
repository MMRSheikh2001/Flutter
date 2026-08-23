import 'package:flutter/material.dart';

class GigOrderDetails extends StatefulWidget {
  final int gigOrderId;

  const GigOrderDetails({super.key,required this.gigOrderId});

  @override
  State<GigOrderDetails> createState() => _GigOrderDetailsState();
}

class _GigOrderDetailsState extends State<GigOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
