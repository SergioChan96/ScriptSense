import 'package:flutter/material.dart';

import '../../router/typed_routes.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const Color color = Colors.redAccent;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      expandedHeight: 0.0,
      floating: false,
      pinned: true,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      iconTheme: IconThemeData(
        color: Colors.redAccent,
      ),
      leading: title == 'Resultate' ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          CameraRoute().go(context);
        },
      ) : null,
      title:
      Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: screenHeight * 0.035,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}