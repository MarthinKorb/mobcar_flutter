import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeroImagePage extends StatelessWidget {
  final Widget child;
  final Object tag;
  final String title;
  const HeroImagePage({
    @required this.title,
    @required this.child,
    @required this.tag,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        backgroundColor: Colors.black,
      ),
      body: InteractiveViewer(
        maxScale: 2.0,
        child: Center(
          child: Hero(
            child: child,
            tag: tag,
          ),
        ),
      ),
    );
  }
}
