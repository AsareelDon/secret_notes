import 'package:flutter/cupertino.dart';

class ContainerWrapper extends StatelessWidget {
  final Widget child;
  final Color? containerColor;
  final Color? shadowColor;
  final bool withBoxDecoration;
  final double paddingEdges;

  const ContainerWrapper({
    super.key,
    required this.child,
    this.containerColor,
    this.shadowColor,
    required this.paddingEdges,
    required this.withBoxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(paddingEdges),
      decoration: withBoxDecoration ? BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor!,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ) : null,
      child: child,
    );
  }
}