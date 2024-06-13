import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const Color color = Colors.redAccent;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0.0,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: color,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}