import 'package:flutter/material.dart';
import './../ui/news_details.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final double height;
  final double width;
  final double padding;

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  const NewsCard({
    Key? key,
    required this.height,
    required this.width,
    required this.padding,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => NewsDetail(
                height: height * 0.55,
                width: width,
                padding: width * 0.03,
                author: author,
                title: title,
                description: description,
                url: url,
                urlToImage: urlToImage,
                content: content,
                publishedAt: publishedAt),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.only(bottom: width * 0.03),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.05)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height * 0.55,
              child: FadeInImage(
                placeholder: Image.network(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  height: height * 0.02,
                  ''
                ).image,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    alignment: Alignment.center,
                    height: height * 0.59,
                    child: Image.network(''),
                  );
                },
                image: Image.network(
                  urlToImage,
                  fit: BoxFit.scaleDown,
                ).image,
              ),
            ),
            SizedBox(
              child: Text(
                DateFormat("yyyy-MM-dd")
                    .parse(publishedAt)
                    .toLocal()
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: height * 0.15,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


