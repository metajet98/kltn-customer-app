import 'package:customer_app/models/notification/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItemView extends StatelessWidget {
  final News news;

  const NewsItemView({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              news.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                news.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
