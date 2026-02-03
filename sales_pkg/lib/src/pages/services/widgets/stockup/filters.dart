import 'package:flutter/material.dart';

class FiltersCard extends StatelessWidget {
  const FiltersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0), // Add padding around the DistanceCard
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Define the action when the button is pressed
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduced border radius
                  side: const BorderSide(color: Colors.black), // Border color
                ),
              ),
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.black, // Button text color
                  fontWeight: FontWeight.bold, // Button text weight
                ),
              ),
            ),
            SizedBox(width: 16), // Add some space between the icons
            TextButton(
              onPressed: () {
                // Define the action when the button is pressed
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduced border radius
                  side: const BorderSide(color: Colors.black), // Border color
                ),
              ),
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.black, // Button text color
                  fontWeight: FontWeight.bold, // Button text weight
                ),
              ),
            ),
            SizedBox(width: 16), // Add some space between the icons
            TextButton(
              onPressed: () {
                // Define the action when the button is pressed
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduced border radius
                  side: const BorderSide(color: Colors.black), // Border color
                ),
              ),
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.black, // Button text color
                  fontWeight: FontWeight.bold, // Button text weight
                ),
              ),
            ),
            SizedBox(width: 16), // Add some space between the icons
            TextButton(
              onPressed: () {
                // Define the action when the button is pressed
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduced border radius
                  side: const BorderSide(color: Colors.black), // Border color
                ),
              ),
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.black, // Button text color
                  fontWeight: FontWeight.bold, // Button text weight
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}