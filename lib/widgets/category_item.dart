import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  Category(
      {super.key,
      required this.currentCategory,
      required this.imagePath,
      required this.categoryName});
  bool currentCategory;
  final String imagePath;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: Card(
            color: currentCategory
                ? const Color.fromARGB(255, 185, 181, 81)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: currentCategory
                      ? Colors.transparent
                      : const Color.fromARGB(255, 185, 181, 81)),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                categoryName,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: currentCategory
                      ? Colors.white
                      : const Color.fromARGB(255, 185, 181, 81),
                ),
              )
                  // Image.asset(imagePath),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
