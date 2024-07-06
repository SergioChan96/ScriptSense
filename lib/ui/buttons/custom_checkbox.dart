import 'package:flutter/material.dart';


class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: value ? Colors.redAccent : Colors.grey, width: 2.0),
        ),
        child: value
            ? Icon(Icons.check, color: Colors.redAccent, size: 20 * 0.8)
            : null,
      ),
    );
  }
}