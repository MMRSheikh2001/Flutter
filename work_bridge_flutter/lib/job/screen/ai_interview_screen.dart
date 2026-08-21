import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiInterviewScreen extends ConsumerStatefulWidget {
  final int applicationId;

  const AiInterviewScreen({super.key,required this.applicationId});

  @override
  ConsumerState<AiInterviewScreen> createState() => _AiInterviewScreenState();
}

class _AiInterviewScreenState extends ConsumerState<AiInterviewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
