import 'package:flutter/material.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key, required this.jobId});

  final int jobId;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
