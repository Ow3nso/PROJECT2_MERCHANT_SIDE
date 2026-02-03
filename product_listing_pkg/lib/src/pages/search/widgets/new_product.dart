import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({super.key, this.data = const []});
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .61,
        crossAxisSpacing: 9,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          InkWell(
            onTap: () {
              NavigationService.navigate(
                context,
                ProductListingView.routeName,
                arguments: {
                  'title': data[index]['name'],
                  'type': ListingType.other
                },
              );
            },
            child: SizedBox(
              width: size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImageCard(
                    fit: BoxFit.cover,
                    image:
                        'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  data[index]['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
