import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});
  final List<Map<String, String>> news = [
    {
      "title": "Demand for Indian generic drugs skyrockets...",
      "author": "Wade Warren",
      "content":
          "The demand for Indian generic drugs has shot up in China amid the massive COVID surge...",
      "time": "Updated just now",
      "image": "https://randomuser.me/api/portraits/men/1.jpg", // Avatar
    },
    {
      "title": "Stock markets see unprecedented growth...",
      "author": "Jane Doe",
      "content":
          "The global stock market saw a major surge today, with experts predicting further gains...",
      "time": "10 min ago",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: news.length,
      itemBuilder: (context, index) {
        final article = news[index];

        return Card(
          color: Colors.yellow[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "LIVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),

                // Title
                Text(
                  article["title"]!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),

                // Time
                Text(
                  article["time"]!,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 12),

                // Author Row
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(article["image"]!),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Published by ${article["author"]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // Content
                Text(
                  article["content"]!,
                  style: TextStyle(color: Colors.black87),
                ),

                // Actions Row
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.comment, color: Colors.grey[800]),
                    SizedBox(width: 10),
                    Icon(Icons.share, color: Colors.grey[800]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
