import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetButton extends StatelessWidget {
  PetButton({
    Key? key, // Add Key? key parameter here
    required this.imageUrl,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        Container(
          width: s.width * .22,
          height: s.height * 0.12,
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepPurple : Colors.deepPurple[100],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
               color:  isSelected ?
                   Colors.deepPurple.withOpacity(0.5)
                  : Colors.white.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Image.asset(imageUrl,
          color: isSelected ?
              Colors.white: Colors.grey,
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
          title,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),

      ],
    );
  }
}
