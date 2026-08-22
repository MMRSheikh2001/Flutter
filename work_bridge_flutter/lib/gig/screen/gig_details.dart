import 'package:flutter/material.dart';

class GigDetails extends StatefulWidget {

  final int gigId;
  const GigDetails({super.key,required this.gigId});

  @override
  State<GigDetails> createState() => _GigDetailsState();
}

class _GigDetailsState extends State<GigDetails> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
