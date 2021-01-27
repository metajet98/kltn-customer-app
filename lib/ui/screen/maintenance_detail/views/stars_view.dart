import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class StarView extends StatefulWidget {
  final Function(int) onStarChoose;

  const StarView({Key key, this.onStarChoose}) : super(key: key);

  @override
  _StarViewState createState() => _StarViewState();
}

class _StarViewState extends State<StarView> {
  int currentStar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) => _buildStar(index + 1)).toList(),
      ),
    );
  }

  Widget _buildStar(int position) {
    var isSelected = position <= currentStar;
    return Padding(
      padding: EdgeInsets.all(8),
      child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            isSelected ? Icons.star : Icons.star_border,
            color: isSelected ? Colors.yellow : Colors.grey,
            size: 50,
          ),
          onPressed: () {
            widget.onStarChoose(position);
            setState(() {
              currentStar = position;
            });
          }),
    );
  }
}
