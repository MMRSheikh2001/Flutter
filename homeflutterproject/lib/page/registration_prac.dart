import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class RegistrationPrac extends StatefulWidget {
  const RegistrationPrac({super.key});

  @override
  State<RegistrationPrac> createState() => _RegistrationPracState();
}

class _RegistrationPracState extends State<RegistrationPrac> {

  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmPassword=TextEditingController();
  final TextEditingController cell=TextEditingController();
  final TextEditingController address=TextEditingController();

final DateTimeFieldPickerPlatform dob=DateTimeFieldPickerPlatform.material;

String? selectedGender;
DateTime? selectedDate;

final _formKey=GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
