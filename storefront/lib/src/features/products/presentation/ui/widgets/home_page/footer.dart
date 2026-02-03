import 'package:flutter/material.dart';

import '../../../../../../shared/ui/widgets/buttons.dart';
import '../../../../../../core/utils/app_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -5), // changes position of shadow to the top
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Regalia Apparel',
            style: AppTextStyles.title,
          ),
          const SizedBox(height: 8),
          const Text(
            'Authentic kenyan brand aiming at producing high standard, cormfortable, affordable, durable and sustainable, apparels that define value to the society',
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 16), 

          _buildDividerRow('Help Center'),
          _buildDividerRow('Contact Us'),
          _buildDividerRow('About Lukhu'),
          const Divider(),

          const SizedBox(height: 16), 

          CustomButton(
            name: "Open a free store", 
            width: double.infinity, 
            height: 50, 
            backgroundColor: Color(0xFF003CFF),
            onPressed: () {},
          ),

          const SizedBox(height: 16),

          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Made with ', 
                      style: TextStyle(
                        color: Color(0xFF615E69),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite, color: Color(0xFF615E69), size: 14),
                    Text(
                      ' by Dukastax', 
                      style: 
                      TextStyle(
                        color: Color(0xFF615E69),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'A product of Lukhu Inc.',
                  style: TextStyle(
                    color: Color(0xFF615E69),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDividerRow(String title) {
    return Column(
      children: [
        const Divider(height: 16), // Reduced height of the divider
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title, 
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
              IconButton(
                icon: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color to black
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}