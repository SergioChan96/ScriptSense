import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final ValueChanged<bool> onFilterChanged;

  FilterButton({required this.onFilterChanged});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool showOnlyFavorites = false;
  bool sortDateAscending = false;
  bool sortDateDescending = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey.shade50,
      ),
      onPressed: () {},
      child: PopupMenuButton<String>(
        icon: Icon(Icons.menu, size: 18, color: showOnlyFavorites || sortDateAscending || sortDateDescending ? Colors.redAccent : Colors.grey.shade700),
        onSelected: (String? newValue) {
          setState(() {
            if (newValue == 'Meine Favoriten') {
              showOnlyFavorites = !showOnlyFavorites;
              widget.onFilterChanged(showOnlyFavorites);
            }
            if (newValue == 'Datum aufsteigend') {
              sortDateAscending = !sortDateAscending;
              widget.onFilterChanged(sortDateAscending);
            }
            if (newValue == 'Datum absteigend') {
              showOnlyFavorites = !showOnlyFavorites;
              widget.onFilterChanged(showOnlyFavorites);
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
                SizedBox(width: 8),
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
                SizedBox(width: 8),
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
                SizedBox(width: 8),
                Text('Datum absteigend', style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}