import 'package:pet_care/expense.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/utill/components/expense_summary.dart';
import 'package:pet_care/utill/components/expense_tile.dart';
import 'package:pet_care/utill/data/expense_data.dart';
import 'package:pet_care/utill/models/expense_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class ExpenseController extends StatefulWidget{
  const ExpenseController({super.key});
  @override
  State<ExpenseController> createState()=> _ExpenseControllerState();
}
class _ExpenseControllerState extends State<ExpenseController>{
  final newExpenseNameController= TextEditingController();
  final newExpenseAmountController= TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context,listen: false).prepareData();
  }

  void addNewExpense(){
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(
                hintText: "Expense name",
              ),
            ),

            TextField(
              controller: newExpenseAmountController,
              decoration: const InputDecoration(
                hintText: "Expense in Taka",
              ),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
  void deleteExpense(ExpenseItem expense){
    Provider.of<ExpenseData>(context,listen: false).deleteExpense(expense);
  }
  void save(){
    ExpenseItem newExpense= ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context,listen: false).addNewExpense(newExpense);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense()));
    Navigator.pop(context);
    clear();
  }
  void cancel(){
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense()));
   // Navigator.pop(context);
    clear();
  }
  void clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }
  @override
  Widget build(BuildContext context){
    return Consumer<ExpenseData>(
      builder: (context,value,child)=>Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Expense Tracker',style: TextStyle(
              fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.bold
          ),
          ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
            ),
          centerTitle: true,
        ),
          backgroundColor: Colors.grey[300],
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            backgroundColor: Colors.black,
            child:const Icon(Icons.add,color: Colors.white,),
          ),
          body:ListView(children: [
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: value.getallExpenseList().length,
              itemBuilder: (context,index)=> ExpenseTile(
                name: value.getallExpenseList()[index].name,
                amount:value.getallExpenseList()[index].amount ,
                dateTime: value.getallExpenseList()[index].dateTime,
                deleteTapped: (p0)=> deleteExpense(value.getallExpenseList()[index]),
              ),
            ),
          ],)
      ),
    );
  }
}