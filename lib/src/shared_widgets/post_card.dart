import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String? cardTitle;
  final String? cardSubTitle;
  final String? cardText;
  final String? cardImage;
  const PostCard({
    Key? key,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.cardText,
    required this.cardImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
     // height: MediaQuery.of(context).size.height,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.account_circle_rounded, size: 45),
              title: Text(cardTitle ?? "Guest", style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 20),),
              subtitle: Text(cardSubTitle ?? 'Some subtitle', style: const TextStyle(fontSize: 18, color: Colors.blueGrey),),
            ),
            Text(cardText ?? 'This is some dummy content to represent a user\'s post'),
            Image.network(
              cardImage ?? "",
             // 'https://images.pexels.com/photos/6568189/pexels-photo-6568189.jpeg?auto=compress&cs=tinysrgb&w=400',
              height: 350,
              width: MediaQuery.of(context).size.width,
            ),
          ],

        ),
      ),
    );
  }
}
