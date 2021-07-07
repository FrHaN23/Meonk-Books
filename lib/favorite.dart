import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      return FavoriteScreenMobile();
    });
  }
}

class FavoriteScreenMobile extends StatefulWidget {
  @override
  FavoriteScreenMobileState createState() => FavoriteScreenMobileState();
}

class FavoriteScreenMobileState extends State<FavoriteScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
