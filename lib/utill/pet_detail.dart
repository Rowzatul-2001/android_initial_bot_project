import 'package:flutter/material.dart';
import 'package:pet_care/utill/pet_model.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({super.key,required this.pet,required this.bgColor});
final Pet pet;
final Color bgColor;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height*0.5,
                  decoration: BoxDecoration(
                      color: bgColor,
                      gradient: LinearGradient(
                        colors: [
                          bgColor,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.9999,0.4],
                      )
                  ),
                ),
                SafeArea(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        pet.imageUrl,
                        height: size.height*0.35,
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                        ],
                      ),
                    )
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: size.height*0.15,
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.white38.withOpacity(0.5),
                          blurRadius: 30,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child:Text(
                                pet.name,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              ),
                              Icon(
                                pet.gender=="Male"? Icons.male_outlined:Icons.female_outlined,
                                    color: Colors.white,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Text(
                                pet.breed,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              ),
                              Text(
                                "${pet.age} years old",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "In the tapestry of life, there are few threads as heartwarming as the companionship of a beloved pet. For many, They are not just a furry, feathered, or scaly friend; They are an integral part of the family, weaving joy, laughter, and unconditional love into our daily lives <333.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            )
          ],
        ),
    );
  }
}
