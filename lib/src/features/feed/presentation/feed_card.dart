import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final String? cardTitle;
  final String? cardSubTitle;
  final String? cardText;
  final String? cardImage;
  const FeedCard({
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
              trailing: const Icon(Icons.more_horiz_rounded, size: 20, color: Colors.blueGrey),
            ),
            Text(cardText ?? 'This is some dummy content to represent a user\'s post', textAlign: TextAlign.center),
            Image.network(
              cardImage ?? "",
              height: 350,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.thumb_up_alt_outlined, color: Colors.blueGrey,),
                SizedBox(width: 8),
                Text('Like'),
                SizedBox(width: 18),
                Icon(Icons.comment_outlined, color: Colors.blueGrey,),
                SizedBox(width: 8),
                Text('Comment'),
                SizedBox(width: 18),
                Icon(Icons.share_outlined, color: Colors.blueGrey,),
                SizedBox(width: 8),
                Text('Share'),
                SizedBox(width: 18),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
