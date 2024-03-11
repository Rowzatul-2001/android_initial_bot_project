import 'package:flutter/material.dart';
import 'package:pet_care/utill/pet_model.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.pet,
    required this.color
  });
final Pet pet;
final Color color;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.width/2 - 40,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const[
              BoxShadow(
                blurRadius: 30,
                color: Colors.black87,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(child: Container(),

              ),
              Expanded(
                child: Container(
                padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pet.name,
                               maxLines: 1,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                           ),
                          ),
                          Icon(
                            pet.gender.toLowerCase()=="male" ?
                                Icons.male_outlined : Icons.female_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        pet.breed,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
              ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width/2 - 20,
          height: size.width/2,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 30,
                color: Colors.black12,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width/2+1,
          height: size.width/2+40,
          child: Image.asset(pet.imageUrl),
        ),
      ],
    );
  }
}
