import 'package:flutter/material.dart';
import 'package:gemini_chatbot/providers/chip_provider.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:provider/provider.dart';

class MyCustomChips extends StatefulWidget {
  const MyCustomChips({super.key, this.chipName, required this.list});
  final String? chipName;
  final List list;

  @override
  State<MyCustomChips> createState() => _MyCustomChipsState();
}

class _MyCustomChipsState extends State<MyCustomChips> {
  int _selectedIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: List<Widget>.generate(
        widget.list.length,
        (int index) {
          return ChoiceChip(
            label: Text(widget.list[index]),
            selected: _selectedIndex == index,
            autofocus: true,
            checkmarkColor: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.green[100]!),
            selectedColor: kGreenColor,
            labelStyle: const TextStyle(color: Colors.black),
            onSelected: (bool selected) {
              if (widget.chipName == 'genre') {
                Provider.of<ChipProvider>(context, listen: false)
                    .addGenreList(widget.list[index]);
              } else if (widget.chipName == 'country') {
                Provider.of<ChipProvider>(context, listen: false)
                    .addCounryList(widget.list[index]);
              } else if (widget.chipName == 'game') {
                Provider.of<ChipProvider>(context, listen: false)
                    .addGameList(widget.list[index]);
              }

              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
