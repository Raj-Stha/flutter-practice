// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/model/moviedata.dart';

class MovieDashboard extends StatefulWidget {
  @override
  State<MovieDashboard> createState() => _MovieDashboardState();
}

class _MovieDashboardState extends State<MovieDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Yo Yo Movie"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ListView.builder(
            itemCount: MovieData.movieContent.length,
            itemBuilder: (context, int index) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Transform.translate(
                          offset: Offset(50, 0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "${MovieData.movieContent[index]['Images'][0]}",
                            ),
                          )),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(MovieData.movieContent[index]['Title']),
                              Text(MovieData.movieContent[index]['imdbRating']),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Released: ${MovieData.movieContent[index]['Released']}"),
                              Text(MovieData.movieContent[index]['Runtime']),
                              Text(MovieData.movieContent[index]['Rated']),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
