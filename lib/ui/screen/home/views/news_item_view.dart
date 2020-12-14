import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
            ),
          ),
          Text("aaaaaaaaaaaaaaaasadadasdassad", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
