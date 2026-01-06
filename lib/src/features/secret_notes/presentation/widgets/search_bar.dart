import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.black87), // dark text for contrast
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF6B7280)),
          hintText: 'Search notes',
          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}