import 'package:flutter/material.dart';
import 'package:pet_care/rem.dart';
import 'package:pet_care/utill/db_helper.dart';
import 'package:pet_care/utill/rem_model.dart';
import 'package:intl/intl.dart';
class AddUpdateTask extends StatefulWidget {
  int? remId;
  String? remTitle;
  String? remDesc;
  String? remDt;
  bool? update;
 AddUpdateTask({
    this.remId,
   this.remTitle,
   this.remDesc,
   this.remDt,
   this.update,
});

  @override
  State<AddUpdateTask> createState() => _AddUpdateTaskState();
}

class _AddUpdateTaskState extends State<AddUpdateTask> {
  DBHelper? dbHelper;
  late Future<List<RemModel>> dataList;
  final _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    dbHelper=DBHelper();
    loadData();
  }
  loadData() async{
    dataList=dbHelper!.getDatalist();
  }
  @override
  Widget build(BuildContext context) {
    final titleController=TextEditingController(text: widget.remTitle);
    final descController=TextEditingController(text: widget.remDesc);
    String appTitle;
    if(widget.update==true){
      appTitle="Update Task";
    }else{
      appTitle="Add Task";
    }
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.deepPurple[200],
  title: Text(appTitle,
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple
  ),
  ),
),
    body: Column(
      children: [
        Image.asset(
          "assests/images/pet4.png",
          width: 270,
          height: 300,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20) ,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(key: _formkey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: titleController ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          hintText: "N O T E   T I T L E",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Text";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 5,
                        controller: descController ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          hintText: "W R I T E   N O T E S   H E R E",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Text";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: (){
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                if (widget.update == true) {
                                  dbHelper!.update(RemModel(
                                    id: widget.remId,
                                    title: titleController.text,
                                    desc: descController.text,
                                    dateandtime: widget.remDt,
                                  ));
                                } else {
                                  dbHelper!.insert(RemModel(
                                    title: titleController.text,
                                    desc: descController.text,
                                    dateandtime: DateFormat('yMd').add_jm().format(DateTime.now()).toString(),
                                  ));
                                }

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Rem()));
                                titleController.clear();
                                descController.clear();
                                print('added');
                              });
                            }

                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding:EdgeInsets.symmetric(horizontal: 10),
                            height: 55,
                            width: 120,
                            decoration: BoxDecoration(
                                boxShadow: [
                                 /* BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ) */
                                ]
                            ),
                            child: Text(
                              'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            titleController.clear();
                            descController.clear();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 55,
                            width: 120,
                            decoration: BoxDecoration(
                              boxShadow: [
                                /* BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ) */
                              ],
                            ),
                            child: Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}
