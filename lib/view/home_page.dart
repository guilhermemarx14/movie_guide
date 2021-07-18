import 'package:flutter/material.dart';
import 'package:movie_guide/controller/simplified_movie_controller.dart';
import 'package:movie_guide/model/simplified_movie.dart';
import 'package:movie_guide/util/constants.dart';
import 'dart:async';

import 'detailed_movie_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SimplifiedMovie> movies = [];

  void initState() {
    SimplifiedMovieController.getMovies().then((value) {
      setState(() {
        movies = value;
        print(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var body;
    MyImage(String? url) {
      return Image.network(url ?? '');
    }

    Title(String? title) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title == null ? 'null' : title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ytsGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    MovieShow(SimplifiedMovie movie) {
      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedMovieView(movie.id!))),
        child: Column(
          children: [
            Title(movie.title),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: MyImage(movie.poster_url),
            ),
          ],
        ),
      );
    }

    if (movies.isEmpty)
      body = Center(child: CircularProgressIndicator());
    else {
      var allMovies = <Widget>[];

      movies.forEach((element) => allMovies.add(MovieShow(element)));
      body = SingleChildScrollView(
        child: Center(
          child: Column(
            children: allMovies,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: appBarBackground,
          title: Text(
            'Movie Guide',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: ytsGreen),
          ),
        ),
      ),
      body: body,
    );
  }
}
