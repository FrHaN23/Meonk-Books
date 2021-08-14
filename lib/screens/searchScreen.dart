import 'package:buku_meonk/screens/View.dart';
import 'package:buku_meonk/main.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class SearchScreenMain extends StatelessWidget {
  const SearchScreenMain({Key? key, book, isMarked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(),
        body: GridViewMain(
          list: queryList,
        ));
  }
}

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(55);
  @override
  _AppBarDesignState createState() => _AppBarDesignState();
}

class _AppBarDesignState extends State<SearchBar> {
  TextEditingController _searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
        child: AppBar(
          brightness:
              global.isDarkModeEnabled ? Brightness.dark : Brightness.light,
          title: searchField(),
          actions: [
            IconButton(
                onPressed: () {
                  queryList.clear();
                  _searchQueryController.clear();
                  runApp(MyApp());
                },
                icon: Icon(Icons.close_rounded))
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              queryList.clear();
              Navigator.of(context).pop();
            },
          ),
          backgroundColor:
              global.isDarkModeEnabled ? Colors.black : Colors.amber[300],
          foregroundColor:
              global.isDarkModeEnabled ? Colors.white : Colors.black,
          iconTheme: IconThemeData(
              color: global.isDarkModeEnabled ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget searchField() {
    final List<Book> bookList = booksList;
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search ISBN, Title or Author",
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: global.isDarkModeEnabled ? Colors.white60 : Colors.black54),
      ),
      style: TextStyle(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black,
          fontSize: 20),
      onChanged: (query) {
        queryList.clear();
        if (query.isNotEmpty) {
          for (int i = 0; i < bookList.length; i++) {
            if (bookList[i].title.toLowerCase().contains(query.toLowerCase()) ||
                bookList[i]
                    .author
                    .toLowerCase()
                    .contains(query.toLowerCase())) {
              queryList.add(bookList[i]);
              runApp(MyApp());
            }
          }
        }
        if (query.isEmpty) {
          queryList.clear();
          runApp(MyApp());
        }
      },
    );
  }
}
