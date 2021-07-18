import 'package:flutter/material.dart';
import 'package:movie_guide/controller/detailed_movie_controller.dart';
import 'package:movie_guide/model/detailed_movie.dart';
import 'package:movie_guide/util/constants.dart';
import 'package:intl/intl.dart';

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
    final currencyMask = new NumberFormat("U\$ #,##0", "en_US");
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
              image: NetworkImage(movie!.poster_url!, scale: 5),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    movie!.title! + '   [${movie!.original_language}]',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\'' + movie!.tagline! + '\'',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 15,
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
                    width: 1 / 3 * width,
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
                    movie!.overview! + '  (${movie!.runtime} min)',
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Avaluation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('${movie!.vote_average!}/10'),
                        Icon(Icons.star_border)
                      ],
                    ),
                    Column(
                      children: [
                        Text('${movie!.vote_count!} votes'),
                        Icon(Icons.people_alt_outlined)
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Extra Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ytsGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Original Title: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                            '${movie!.original_title!.length > 30 ? movie!.original_title!.substring(0, 30) + ' ...' : movie!.original_title!}'),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Release Date: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(DateFormat('dd/MM/yyyy').format(
                            DateFormat('yyyy-MM-dd')
                                .parse(movie!.release_date!))),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Budget: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('${currencyMask.format(movie!.budget!)}'),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Revenue: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('${currencyMask.format(movie!.revenue!)}'),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: appBarBackground,
          title: Text(
            'Movie Details',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: ytsGreen),
          ),
        ),
      ),
      body: body,
    );
  }
}
