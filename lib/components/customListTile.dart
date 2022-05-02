import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/article_model.dart';
import 'package:flutter_application_1/pages/articles_details_page.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customListTile(Article article, BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlePage(article: article)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  padding: const EdgeInsets.all(5),
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    article.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  width: 200,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(article.description,
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 12)),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ));
}
