import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/customListTile.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'services/api_services.dart';
import 'model/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  late Future<List<Article>> articles;

  Future<void> _pullRefresh() async {
    Future<List<Article>> refreshed = client.getArticle();
    setState(() {
      articles = refreshed;
    });
  }

  @override
  void initState() {
    super.initState();

    ///whatever you want to run on page build
    Future<List<Article>> onLoad = client.getArticle();
    setState(() {
      articles = onLoad;
    });
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Articles",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.green,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _pullRefresh();
          },
          child: FutureBuilder(
            future: articles,
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) =>
                        customListTile(snapshot.data![index], context));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
