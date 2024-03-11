
import 'package:flutter/material.dart';
import 'package:pet_care/utill/add_update_task.dart';
import 'package:pet_care/utill/db_helper.dart';
import 'package:pet_care/utill/rem_model.dart';
class Rem extends StatefulWidget {
  const Rem({super.key});

  @override
  State<Rem> createState() => _RemState();
}

class _RemState extends State<Rem> {
  DBHelper? dbHelper;
  late Future<List<RemModel>> dataList;
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
    return Scaffold(
     appBar: AppBar(
       title: Text('Reminder',
       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.deepPurple),
       ),
       backgroundColor: Colors.deepPurple[200],
     ),
      body: Column(
        children: [
        Expanded(child: FutureBuilder(
            future: dataList,
            builder: (context,AsyncSnapshot<List<RemModel>> snapshot){
              if(!snapshot.hasData||snapshot.data == null){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(snapshot.data!.length==0){
                return Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                );
              }
              else{
                return ListView.builder(
                 shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context,index){
                   int remId=snapshot.data![index].id!.toInt();
                   String remTitle=snapshot.data![index].title!.toString();
                   String remDesc=snapshot.data![index].desc!.toString();
                   String remDt=snapshot.data![index].dateandtime!.toString();
                   return Dismissible(
                     key : ValueKey<int>(remId),
                    direction: DismissDirection.endToStart,
                    background:Container(
                    color: Colors.redAccent,
                    child: Icon(Icons.delete_forever,color: Colors.white,),
                    ),
                     onDismissed: (DismissDirection direction){
                       setState(() {
                          dbHelper!.delete(remId);
                          dataList=dbHelper!.getDatalist();
                          snapshot.data!.remove(snapshot.data![index]);
                       });
                   },
                     child: Container(
                       margin: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: Colors.deepPurple[200],
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black12,
                             blurRadius: 5,
                             spreadRadius: 1,
                           )
                         ],
                       ),
                       child: Column(
                         children: [
                           ListTile(
                             contentPadding: EdgeInsets.all(10),
                             title: Padding(
                               padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                remTitle,
                                style: TextStyle(fontSize: 19),
                              ),
                             ),
                             subtitle: Text(
                               remDesc,
                               style:TextStyle(
                                 fontSize: 17,
                               ) ,
                             ),
                           ),
                           Divider(
                             color: Colors.deepPurple,
                             thickness: 0.8,
                           ),
                           Padding(padding: EdgeInsets.symmetric(
                               vertical: 3,
                               horizontal: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                  remDt,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUpdateTask(
                                       remId: remId,
                                       remTitle: remTitle,
                                       remDesc: remDesc,
                                       remDt: remDt,
                                       update: true,
                                     )));
                                   },
                                   child: Icon(Icons.edit_note_outlined,color: Colors.white,size: 28,),
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                  },
                );
              }
            }
          ),
         ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.deepPurple[400],
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AddUpdateTask(),
          ));
        },

      ),
    );
  }
}
