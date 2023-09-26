import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const ImagePage({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: Image.network(
            imagePath,
            height: 40,
          )),
    );
  }
}
