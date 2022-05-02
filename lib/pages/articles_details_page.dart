import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/article_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({required this.article});

  _launchURL() async {
    var url = article.url;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  String toDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white10, Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(8, 160, 10, 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Flexible(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            article.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36.0,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FittedBox(
                        child: Text(
                          article.author,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        toDate(article.publishedAt),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(article.description,
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  onPressed: _launchURL,
                  child: const Text('Read more >'),
                )
              ],
            ),
          )),
    );
  }
}
