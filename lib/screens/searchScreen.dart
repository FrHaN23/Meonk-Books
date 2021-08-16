import 'package:buku_meonk/screens/View.dart';
import 'package:buku_meonk/main.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class SearchScreenMain extends StatefulWidget {
  const SearchScreenMain({Key? key, book, isMarked}) : super(key: key);

  @override
  _SearchScreenMainState createState() => _SearchScreenMainState();
}

class _SearchScreenMainState extends State<SearchScreenMain> {
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
  void dispose() {
    _searchQueryController..dispose();
    super.dispose();
  }

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
            clearButton(),
          ],
          leading: popButton(),
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

  Widget clearButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            queryList.clear();
            _searchQueryController.clear();
            runApp(MyApp());
          });
        },
        icon: Icon(Icons.close_rounded));
  }

  Widget popButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        queryList.clear();
        Navigator.of(context).pop();
      },
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
        setState(() {
          if (query.isNotEmpty) {
            for (int i = 0; i < bookList.length; i++) {
              var titleChecking =
                  bookList[i].title.toLowerCase().contains(query.toLowerCase());
              var authorChecking = bookList[i]
                  .author
                  .toLowerCase()
                  .contains(query.toLowerCase());

              if (titleChecking || authorChecking) {
                queryList.add(bookList[i]);
                return runApp(MyApp());
              }
            }
          }
          if (query.isEmpty) {
            queryList.clear();
            return runApp(MyApp());
          }
        });
      },
    );
  }
}
