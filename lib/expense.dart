import 'package:pet_care/utill/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/utill/expense_controller.dart';
import 'package:provider/provider.dart';
class Expense extends StatelessWidget {
  const Expense({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ExpenseController(),
      ),
    );
  }
}


