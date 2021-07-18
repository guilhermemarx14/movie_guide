import 'package:flutter/material.dart';
import 'package:movie_guide/controller/detailed_movie_controller.dart';
import 'package:movie_guide/model/detailed_movie.dart';
import 'package:movie_guide/util/constants.dart';

class DetailedMovieView extends StatefulWidget {
  const DetailedMovieView(this.id, {Key? key}) : super(key: key);
  final int id;
  @override
  _DetailedMovieViewState createState() => _DetailedMovieViewState();
}

class _DetailedMovieViewState extends State<DetailedMovieView> {
  DetailedMovie? movie;
  @override
  void initState() {
    DetailedMovieController.getMovieById(widget.id).then((value) {
      setState(() {
        movie = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var body;

    Genres(DetailedMovie movie1) {
      var genres = <Widget>[];
      movie1.genres?.forEach((element) {
        genres.add(Text(element, style: TextStyle(color: Colors.white)));
      });

      return Column(
        children: genres,
      );
    }

    if (movie == null)
      body = Center(child: CircularProgressIndicator());
    else
      body = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: NetworkImage(movie!.poster_url!),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie!.original_title! + '   [${movie!.original_language}]',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                  child: Image.network(
                    movie!.poster_url!,
                    width: 2 / 3 * width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    movie!.overview!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Genres',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Genres(movie!),
              ],
            ),
          ),
        ),
      );
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: appBarBackground,
          title: Text('Movie Details'),
        ),
      ),
      body: body,
    );
  }
}
