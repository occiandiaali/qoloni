import 'package:flutter/material.dart';
import 'package:qoloni/src/shared_widgets/box.dart';
import 'package:qoloni/src/utils/functions/helper_functions.dart';
import 'feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> topics = ["Books", "Career", "Travel", "Movies", "Music", "Food"];

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
                        onTap: () => HelperFunctions.feedModalSheet(context),
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
