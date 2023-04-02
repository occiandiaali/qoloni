import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.account_circle_rounded, size: 45),
              title: Text("", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 24),),
              subtitle: Text('Some subtitle', style: TextStyle(fontSize: 18, color: Colors.blueGrey),),
            ),
            const Text('This is some dummy content to represent a user\'s post'),
            Image.network(
              'https://images.pexels.com/photos/6568189/pexels-photo-6568189.jpeg?auto=compress&cs=tinysrgb&w=400',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ],

        ),
      ),
    );
  }
}
