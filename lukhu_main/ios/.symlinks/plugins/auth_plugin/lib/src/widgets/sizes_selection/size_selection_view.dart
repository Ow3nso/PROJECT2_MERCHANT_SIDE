import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sizes_selection/sizes_selection_card.dart';
import 'package:flutter/material.dart';


class SizeSelectionView extends StatelessWidget {
  const SizeSelectionView(
      {super.key, required this.category, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedSelectionCard(
              asseticon: 'assets/icons/top_icon.png',
                category: category,
                signUpFlowController: signUpFlowController,
                title: 'Tops'),
            
            SizedSelectionCard(
              asseticon: 'assets/icons/bottoms_icon.png',
                category: category,
                signUpFlowController: signUpFlowController,
                title: 'Bottoms'),
          ],
        ),
      ),
    );
  }
}
