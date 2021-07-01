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
      appBar: AppBar(),
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                book.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    book.author,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                      child: Text(
                        book.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
