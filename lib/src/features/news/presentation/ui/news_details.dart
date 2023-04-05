import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatefulWidget {
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

  const NewsDetail({
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
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {

  _launchURL(url) async {
    var link = Uri.parse(url);
    if (!await launchUrl(link)) throw "Couldn't open $link";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: widget.width * 0.04),
            child: GestureDetector(
              onTap: () => Share.share(widget.url, subject: widget.title),
              child: const Icon(Icons.share),
            ),
          ),
        ],
        title: SizedBox(child: Text(widget.title)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                FadeInImage(
                    placeholder: Image.network(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      height: widget.height * 0.02,
                      'https://media.giphy.com/media/52qtwCtj9OLTi/giphy.gif'
                    ).image,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: Image.network(
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            height: widget.height * 0.02,
                            'https://media.giphy.com/media/39wBBqmsPOQVLf8paS/giphy.gif'
                        ),
                      );
                    },
                    image: Image.network(widget.urlToImage).image),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(widget.height * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: widget.width * 0.065,
                      fontWeight: FontWeight.w400),
                  ),
                  const Divider(color: Colors.black12,),
                  Text(
                    widget.description,
                    maxLines: 50,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: widget.width * 0.045,
                    ),
                  ),
                  const Divider(color: Colors.black12,),
                  Text(
                    widget.content,
                    maxLines: 50,
                    style: TextStyle(
                      fontSize: widget.width * 0.040,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Divider(color: Colors.black12,),
                  Text(
                    widget.publishedAt,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.3),
              child: ElevatedButton(
                onPressed: () => _launchURL(widget.url),
                child: const Text('See full story'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
