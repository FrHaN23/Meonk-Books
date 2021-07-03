import 'package:flutter/material.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/info.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final Book book = booksList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InfoScreen(book: book);
            }));
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        book.bookThumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                book.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                book.author,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  AbsorbPointer(
                                    child: RatingBar(
                                      initialRating: book.rating,
                                      updateOnDrag: false,
                                      tapOnlyMode: false,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ratingWidget: RatingWidget(
                                          full: Icon(Icons.star,
                                              color: Colors.orange),
                                          half: Icon(
                                            Icons.star_half,
                                            color: Colors.orange,
                                          ),
                                          empty: Icon(
                                            Icons.star_outline,
                                            color: Colors.orange,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    book.rating.toString(),
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                book.description,
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //Text(
                              //    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                            ],
                          ))),
                  Expanded(
                    flex: 1,
                    child: Bookmarked(),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: booksList.length,
    );
  }
}

class Bookmarked extends StatefulWidget {
  @override
  _BookmarkedState createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> {
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isMarked = !isMarked;
        });
      },
      icon: Icon(
        isMarked ? Icons.bookmark : Icons.bookmark_outline,
        size: 30,
      ),
    );
  }
}
