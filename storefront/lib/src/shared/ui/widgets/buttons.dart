import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.name,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Reduced border radius
          ),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
        ),
      ),
      )
    );
  }
}