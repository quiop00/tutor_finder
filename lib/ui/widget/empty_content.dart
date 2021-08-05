import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String message;
  EmptyContent({this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/post.png')),
            Text(
              message,
              maxLines: 3,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
