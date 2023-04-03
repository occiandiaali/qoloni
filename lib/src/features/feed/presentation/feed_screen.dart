import 'package:flutter/material.dart';
import 'package:qoloni/src/shared_widgets/box.dart';
import 'feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> topics = ["Books", "Career", "Travel", "Movies", "Music", "Food"];
  bool enableTextField = true;
  void _showModalSheet(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      context: ctx,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 15
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'),)
          ],
        ),
      )
    );
  }

  void showBottomSheet(ctx) {
    showModalBottomSheet(context: ctx, builder: (ctx) {
    return Wrap(
      children: const [
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
        ),
        ListTile(
          leading: Icon(Icons.copy),
          title: Text('Copy'),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
        ),
      ],
    );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.account_circle_rounded, size: 48),
                    const SizedBox(width: 8),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30, bottom: 20),
                      width: 260,
                      child: TextField(
                        onTap: () => _showModalSheet(context),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          hintText: 'Share with the qolony..',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2, color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2, color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.browse_gallery, size: 38, color: Colors.deepOrangeAccent,)
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: topics.map((topic) {
                          return CustomBox(label: topic, bgColour: Colors.orangeAccent);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
          SizedBox(
            child: SingleChildScrollView(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                    children: topics.map((title) {
                      return FeedCard(
                        cardTitle: title,
                        cardSubTitle: title,
                        cardText: '''In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available
                        ''',
                        cardImage: 'https://images.pexels.com/photos/6568189/pexels-photo-6568189.jpeg?auto=compress&cs=tinysrgb&w=400',
                      );
                    }).toList(),
                  ),
            ),

          ),
        ],
      ),
    );
  }
}
