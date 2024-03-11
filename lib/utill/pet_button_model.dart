
import 'dart:ui';

class PetButtonModel{
 final String imageUrl;
 final String title;
//bool isSelected;
 PetButtonModel({
   required this.imageUrl,
   required this.title,
  // required this.isSelected,
});
}
List<PetButtonModel> petButtonList=[
  PetButtonModel(
    imageUrl:"assests/images/caticon.png",
      title:"Cat",
    //isSelected: true,
  ),
  PetButtonModel(
    imageUrl:"assests/images/birdicon.png",
    title:"Bird",
   // isSelected: true,
  ),
  PetButtonModel(
    imageUrl:"assests/images/dogicon.png",
    title:"Dog",
   // isSelected: true,
  ),
  PetButtonModel(
    imageUrl:"assests/images/rabicon.png",
    title:"Rabbit",
   // isSelected: true,
  ),
];