import 'dart:core';
import 'package:pet_care/utill/data/hive_database.dart';
import 'package:pet_care/utill/datetime/date_time_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/expense_item.dart';

class ExpenseData extends ChangeNotifier{
  List<ExpenseItem> overallExpenseList=[];

  List<ExpenseItem> getallExpenseList(){
    return overallExpenseList;
  }
  final db=HiveDataBase();
  void prepareData(){
    if(db.readData().isNotEmpty){
      overallExpenseList=db.readData();
    }
  }

  void addNewExpense(ExpenseItem newExpense){
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void deleteExpense(ExpenseItem expense){
    overallExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  String getDayName(DateTime dateTime){
    switch (dateTime.weekday){
      case 0:
        return 'Tue';
      case 1:
        return 'Wed';
      case 2:
        return 'Thu';
      case 3:
        return 'Fri';
      case 4:
        return 'Sat';
      case 5:
        return 'Sun';
      case 6:
        return 'Mon';
        default:
          return '';
    }
  }

  DateTime startOfWeekDate(){
    DateTime? startOfWeek;
    DateTime today=DateTime.now();
    for(int i=0;i<7;i++){
      if(getDayName(today.subtract(Duration(days: i)))=='Sun'){
        startOfWeek=today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);

      try {
        double amount = double.parse(expense.amount);

        if (dailyExpenseSummary.containsKey(date)) {
          double currentAmount = dailyExpenseSummary[date]!;
          currentAmount += amount;
          dailyExpenseSummary[date] = currentAmount;
        } else {
          dailyExpenseSummary.addAll({date: amount});
        }
      } catch (e) {
        print('Error parsing amount for date $date: ${expense.amount}');
        // Handle the error, e.g., set a default value or skip this entry
      }
    }

    return dailyExpenseSummary;
  }
}