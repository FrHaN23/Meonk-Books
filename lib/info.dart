import 'package:buku_meonk/screens/infoScreenMobile.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/screens/infoScreenWide.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final Book book;
  final bool isMarked;
  InfoScreen({required this.book, required this.isMarked});
  @override
  InfoScreenState createState() =>
      InfoScreenState(book: book, isMarked: isMarked);
}

class InfoScreenState extends State<InfoScreen> {
  final Book book;
  final bool isMarked;
  InfoScreenState({required this.book, required this.isMarked});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      if (constrains.maxWidth < 830) {
        return InfoScreenMobile(book: book, isMarked: isMarked);
      }
      return InfoScreenWeb(
        book: book,
        isMarked: isMarked,
      );
    });
  }
}
