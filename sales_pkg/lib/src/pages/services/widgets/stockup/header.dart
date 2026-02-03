import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the DistanceCard
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1433fc), // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all( // Border style
            color: const Color(0xFF1433fc),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                children: [
                  const Text(
                    'Distance to the nearest store: 2.5 km', // Text
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16, // Text size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                  const SizedBox(height: 8), // Add some space between the text and the button
                  TextButton(
                    onPressed: () {
                      // Define the action when the button is pressed
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0), // Reduced border radius
                      ),
                    ),
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                        color: const Color(0xFF1433fc), // Button text color
                        fontWeight: FontWeight.bold, // Button text weight
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}