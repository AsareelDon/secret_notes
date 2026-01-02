import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionButtons;
  final bool centerTitle;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actionButtons,
    this.centerTitle = false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 30)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actionButtons
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}