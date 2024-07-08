import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final ValueChanged<bool> onFavoriteFilterChanged;
  final ValueChanged<bool> onDateAscendingFilterChanged;
  final ValueChanged<bool> onDateDescendingFilterChanged;

  FilterButton({required this.onFavoriteFilterChanged, required this.onDateAscendingFilterChanged, required this.onDateDescendingFilterChanged});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool showOnlyFavorites = false;
  bool sortDateAscending = false;
  bool sortDateDescending = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.05,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        ),
        onPressed: () {},
        child: PopupMenuButton<String>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu, size: screenHeight * 0.03, color: showOnlyFavorites || sortDateAscending || sortDateDescending ? Colors.redAccent : Colors.grey.shade700),
            ],
          ),
          onSelected: (String? newValue) {
            setState(() {
              if (newValue == 'Meine Favoriten') {
                showOnlyFavorites = !showOnlyFavorites;
                widget.onFavoriteFilterChanged(showOnlyFavorites);
              }
              if (newValue == 'Datum aufsteigend') {
                if (sortDateDescending) {
                  sortDateDescending = !sortDateDescending;
                  widget.onDateDescendingFilterChanged(sortDateDescending);
                }
                sortDateAscending = !sortDateAscending;
                widget.onDateAscendingFilterChanged(sortDateAscending);
              }
              if (newValue == 'Datum absteigend') {
                if (sortDateAscending) {
                  sortDateAscending = !sortDateAscending;
                  widget.onDateAscendingFilterChanged(sortDateAscending);
                }
                sortDateDescending = !sortDateDescending;
                widget.onDateDescendingFilterChanged(sortDateDescending);
              }
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Meine Favoriten',
              child: Row(
                children: [
                  Icon(showOnlyFavorites ? Icons.favorite : Icons.favorite_border,
                    color: showOnlyFavorites ? Colors.redAccent : Colors.grey[700],
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text('Meine Favoriten', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Datum aufsteigend',
              child: Row(
                children: [
                  Icon(Icons.arrow_upward,
                    color: sortDateAscending ? Colors.redAccent : Colors.grey[700],
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text('Datum aufsteigend', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Datum absteigend',
              child: Row(
                children: [
                  Icon(Icons.arrow_downward,
                    color: sortDateDescending ? Colors.redAccent : Colors.grey[700],
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text('Datum absteigend', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}