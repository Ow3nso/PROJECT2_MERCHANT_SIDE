import 'package:flutter/material.dart';

class FilterSelection extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const FilterSelection({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 234, 243, 250),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Reduced border radius
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const Icon(Icons.favorite, color: Colors.black),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down_sharp, color: Colors.black),
          ],
        ),
      ),
    );
  }
}