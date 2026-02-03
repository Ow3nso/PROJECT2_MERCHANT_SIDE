import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0), // Add padding around the DistanceCard
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all( // Border style
            color: Colors.white,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(Icons.category, color: Colors.black, size: 24),
                Text('Category 1', style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(width: 16), // Add some space between the icons
            Column(
              children: [
                Icon(Icons.category, color: Colors.black, size: 24),
                Text('Category 2', style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(width: 16), // Add some space between the icons
            Column(
              children: [
                Icon(Icons.category, color: Colors.black, size: 24),
                Text('Category 3', style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(width: 16), // Add some space between the icons
            Column(
              children: [
                Icon(Icons.category, color: Colors.black, size: 24),
                Text('Category 4', style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}