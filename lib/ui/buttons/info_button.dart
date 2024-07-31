import 'package:flutter/material.dart';

class InfoButton extends StatefulWidget {
  final String infoText;

  const InfoButton({super.key, required this.infoText});

  @override
  State<InfoButton> createState() => _InfoButtonState();
}

class _InfoButtonState extends State<InfoButton> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
        alignment: Alignment.topRight,
        child: Padding(
        padding: EdgeInsets.only(right: screenWidth * 0.03),
        child: IconButton(
          icon: const Icon(Icons.info_outline, color: Colors.grey,),
          onPressed: () {
            showDialog<AlertDialog>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Information'),
                  content: Text(widget.infoText),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        )
        )
    );
  }
}