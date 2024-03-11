class Pet{
  String name;
  String breed;
  String imageUrl;
  int age;
  String gender;

  Pet({
    required this.name,
    required this.breed,
    required this.imageUrl,
    required this.age,
    required this.gender,
  });
}
List<Pet> bunnies =[
  Pet(
      name: "Floppy",
      breed: "Holland lop",
      imageUrl: "assests/images/bunny1.png",
      age: 2,
      gender: "Female"
  ),
  Pet(
      name: "Thumper",
      breed: "Mini rex",
      imageUrl: "assests/images/bunny2.png",
      age: 1,
      gender: "Male"
  ),
];
List<Pet> cats=[
  Pet(
      name: "Jimi",
      breed: "Bengal cat",
      imageUrl: "assests/images/jimi.png",
      age: 2,
      gender: "Male"
  ),
];
List<Pet> dogs =[
  Pet(
      name: "Tommy",
      breed: "Golden Retriever",
      imageUrl: "assests/images/dog1.png",
      age: 5,
      gender: "Male"
  ),
];
List<Pet> birds=[
  Pet(
      name: "Puku",
      breed: "Cockatiel",
      imageUrl: "assests/images/puku.png",
      age: 2,
      gender: "Male"
  ),
  Pet(
      name: "Puchu",
      breed: "Cockatiel",
      imageUrl: "assests/images/puchu.png",
      age: 2,
      gender: "Female"
  ),
];
