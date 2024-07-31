import 'package:flutter/material.dart';


class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: screenWidth * 0.05,
        height: screenWidth * 0.05,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: value ? Colors.redAccent : Colors.grey, width: 2.0),
        ),
        child: value
            ? Icon(Icons.check, color: Colors.redAccent, size: screenWidth * 0.05 * 0.8)
            : null,
      ),
    );
  }
}