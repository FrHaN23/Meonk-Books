import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class SearchScreenMain extends StatelessWidget {
  const SearchScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(),
    );
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
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Using ISBN, Title Or Author",
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: global.isDarkModeEnabled ? Colors.white60 : Colors.black54),
      ),
      style: TextStyle(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black54,
          fontSize: 20),
      // onChanged: (query)=>updateSearchQuery(query)
    );
  }
}
