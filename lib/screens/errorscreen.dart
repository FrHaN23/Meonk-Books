import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}

class ImageNotfound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('/images/notFound.jpg');
  }
}
