import 'package:flutter/material.dart';
class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
 var wtController=TextEditingController();
 var ftController=TextEditingController();
 var inController=TextEditingController();

 var result=" ";
 var bgColor=Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Pet Bmi',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),

      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 21,),
                TextField(
                  controller:wtController,
                  decoration: InputDecoration(
                    label: Text('Enter pets weight in kg'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller:ftController,
                  decoration: InputDecoration(
                      label: Text('Enter pets height in feet'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller:inController,
                  decoration: InputDecoration(
                      label: Text('Enter pets height in inch'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){

                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();
                  if(wt!=" " && ft!=" " && inch!=" "){
                   var iWt=int.parse(wt);
                   var iFt=int.parse(ft);
                   var iInch=int.parse(inch);

                   var tInch=(iFt*12)+iInch;
                   var tPound=iWt/.045;

                   var bmi= tPound/tInch;
                   var msg=" ";

                   if(bmi<15){
                     msg="Your pet is Under Weight!!";
                     bgColor= Colors.orange;
                   }else if(bmi>15 && bmi<25){
                     msg="Your Pet Has Ideal Weight!!";
                     bgColor= Colors.green;
                   }else if(bmi>25 && bmi<40){
                     msg="Your Pet Has Body Fat!!";
                     bgColor= Colors.yellow;
                   }else{
                     msg="Your pet is Obese!!";
                     bgColor= Colors.red;
                   }

                   setState(() {
                     result="$msg \n Pets BMI is: ${bmi.toStringAsFixed(2)}";
                   });

                  }else{
                    setState(() {
                      result="Please fill all the required blanks!!";
                    });
                  }
                }, child:Text('Calculate')),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
