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
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          size: Theme.of(context).appBarTheme.actionsIconTheme?.size,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ) : null,
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
      backgroundColor: Colors.transparent,
      elevation: Theme.of(context).appBarTheme.elevation,
      titleSpacing: titleSpacing,
      actions: actionButtons
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}