import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors;

class DropOffSelectionDialog extends StatefulWidget {
  const DropOffSelectionDialog({Key? key}) : super(key: key);

  @override
  _DropOffSelectionDialogState createState() => _DropOffSelectionDialogState();
}

class _DropOffSelectionDialogState extends State<DropOffSelectionDialog> {
  String? selectedCity;
  String? selectedRoad;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bool isSubmitDisabled() {
      return selectedCity == null || selectedRoad == null;
    }

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Select Drop-off Point',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 207, 200, 200)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedCity,
                    items: <String>['Nairobi'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'City or Town',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 207, 200, 200)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedRoad,
                    items: <String>[
                      'Waiyaki Way',
                      'Ngong Road',
                      'Thika Road',
                      'Mombasa Road'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRoad = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Main Road',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    SizedBox(
                      width: size.width - 112,
                      child: DefaultButton(
                        label: 'Submit',
                        onTap: isSubmitDisabled()
                            ? null
                            : () {
                                Navigator.of(context).pop(true); // Pop and pass true to indicate success
                              },
                        color: isSubmitDisabled() ? Colors.red : StyleColors.lukhuBlue,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(
                      width: size.width - 112,
                      child: DefaultButton(
                        label: 'Cancel',
                        onTap: () {
                          Navigator.of(context).pop(false); // Pop and pass false to indicate cancellation
                        },
                        boarderColor: StyleColors.lukhuDividerColor,
                        textColor: Theme.of(context).colorScheme.scrim,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
