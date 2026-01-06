import 'package:flutter/material.dart';
import 'package:secret_notes/src/core/ui/container_wrapper.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const NoteTile({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      withBoxDecoration: true,
      paddingEdges: 16,
      containerColor: Theme.of(context).cardColor,
      shadowColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(content, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(date, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
