import 'package:flutter/material.dart';
import 'package:movie_guide/model/simplified_movie.dart';
import 'package:movie_guide/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SimplifiedMovie> movies = [];

  void initState() {
    SimplifiedMovie.getMovies().then((value) {
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
        onTap: () => {},
        child: Column(
          children: [
            Title(movie.title),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Image.network(
                movie.poster_url ?? '',
                width: 2 / 3 * width,
              ),
            ),
          ],
        ),
      );
    }

    if (movies.isEmpty)
      body = Center(child: CircularProgressIndicator());
    else {
      var allMovies = <Widget>[];

      allMovies.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'titulo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ytsGreen,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

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
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(backgroundColor: appBarBackground),
      ),
      body: body,
    );
  }
}
