import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StoryCard extends StatelessWidget {
 // final String author;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  const StoryCard({
    Key? key,
  //  required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {},
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: FadeInImage(
                placeholder: Image.asset(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  height: 200,
                  "assets/images/placeholder_img.png"
                ).image,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: const Text("Error occurred!"),
                  );
                },
                image: Image.network(
                  urlToImage,
                  fit: BoxFit.scaleDown,
                ).image,
              ),
            ),
            SizedBox(
             // height: 80,
              child: Text(
                title,
                maxLines: 3,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  color: Colors.deepOrange
                ),
              ),
            ),
            SizedBox(
              child: Text(
                "published on ${DateFormat("yyyy-MM-dd")
                    .parse(publishedAt)
                    .toLocal()
                    .toString()}",
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
             // height: 10,
              child: Text(
                url,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
