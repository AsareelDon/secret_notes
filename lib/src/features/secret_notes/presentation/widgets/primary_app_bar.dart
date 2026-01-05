import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionButtons;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final double? titleSpacing;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actionButtons,
    this.centerTitle = false,
    required this.automaticallyImplyLeading,
    this.titleSpacing
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: automaticallyImplyLeading ? IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black87,
          size: 34,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ) : null,
      title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          )
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: titleSpacing,
      actions: actionButtons
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}