import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableContainer({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(
            color: _isExpanded ? Theme.of(context).primaryColor : Colors.black,
          ),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.content,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
