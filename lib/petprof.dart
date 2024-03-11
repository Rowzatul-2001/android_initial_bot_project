import 'package:flutter/material.dart';
import 'package:pet_care/utill/pet_detail.dart';
import 'package:pet_care/utill/pet_card.dart';
import 'package:pet_care/utill/pet_button.dart';
import 'package:pet_care/utill/pet_button_model.dart';
import 'package:pet_care/utill/pet_model.dart';

class PetProf extends StatefulWidget {
  const PetProf({super.key});

  @override
  State<PetProf> createState() => _PetProfState();
}

class _PetProfState extends State<PetProf> {
  int currInd=0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Pet Profile',
       style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),
       ),
       backgroundColor: Colors.deepPurple[200],
     ),

     body: Container(
       child: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 50,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 ...List.generate(
                   petButtonList.length,
                     (index) => InkWell(
                       onTap: (){
                         setState((() => currInd=index));
                       },
                       child: PetButton(
                          imageUrl: petButtonList[index].imageUrl,
                          isSelected: currInd==index,
                          title: petButtonList[index].title,
                       ),
                     ),
                 )
               ],
             ),
             ListView.builder(
               shrinkWrap: true,
               padding: EdgeInsets.zero,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: getCurrPet(currInd).length,
               itemBuilder: (context,index){
                 var pet=getCurrPet(currInd);
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(
                         builder:(context){
                          return PetDetail(
                              pet: pet[index],
                              bgColor: index%2==0 ?
                          Colors.deepPurple : Colors.white
                          );
                       }));
                     },
                   child: PetCard(
                       pet: pet[index],
                       color: index%2==0 ?
                       Colors.deepPurple : Colors.white
                   ),
                 );
               },
             ),
           ],
         ),
       ),
     ),
   );
  }
  List<Pet>getCurrPet(int index){
    switch(index){
      case 0:
        return cats;
      case 1:
        return birds;
      case 2:
        return dogs;
      case 3:
        return bunnies;
      default:
        return cats;
    }
  }
}