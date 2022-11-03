import 'package:flutter/material.dart';

class TitleGameSelectedWidget extends StatelessWidget {

  final String categoryName;

  const TitleGameSelectedWidget({
    Key? key, required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        categoryName,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}