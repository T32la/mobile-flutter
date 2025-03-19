import 'package:flutter/material.dart';

class TrendingCategories extends StatelessWidget {
  TrendingCategories({super.key});
  final List<String> categories = [
    "Trending",
    "Health",
    "Sports",
    "Finance",
    "Test",
    "Test",
    "Test",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          category == "Trending"
                              ? FontWeight.bold
                              : FontWeight.normal,
                      color: Colors.white.withOpacity(
                        category == "Trending" ? 1.0 : 0.6,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
