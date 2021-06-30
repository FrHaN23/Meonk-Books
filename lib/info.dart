import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final Book book;
  InfoScreen({required this.book});
  @override
  InfoScreenState createState() => InfoScreenState(book: book);
}

class InfoScreenState extends State<InfoScreen> {
  final Book book;

  InfoScreenState({required this.book});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      return InfoScreenMobile(book: book);
    });
  }
}

class InfoScreenMobile extends StatefulWidget {
  final Book book;
  InfoScreenMobile({required this.book});
  @override
  InfoScreenMobileState createState() => InfoScreenMobileState(
        book: book,
      );
}

class InfoScreenMobileState extends State<InfoScreenMobile> {
  final Book book;
  InfoScreenMobileState({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 15, 15),
                      child: Container(
                          width: 280,
                          child: Image.network(
                            book.bookCover,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              book.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(book.author),
                              )
                            ],
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [Text(book.description)],
            )
          ],
        ),
      ),
    );
  }
}
