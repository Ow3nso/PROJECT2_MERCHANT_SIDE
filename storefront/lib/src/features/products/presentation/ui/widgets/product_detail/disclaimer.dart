import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 243, 250),
        borderRadius: BorderRadius.circular(8), // Add border radius
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.verified_user,
              color: Color(0xFF003CFF),
              size: 36.0,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                'All transactions are covered by LukhuPay\'s buyer protection policies. Your funds are safe when shopping.',
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: null, // Allow text to wrap to the next line
              ),
            ),
          ],
        ),
      ),
    );
  }
}