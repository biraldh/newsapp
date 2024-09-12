


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/newsBloc/news_bloc.dart';
import '../core/theme/color_pallet.dart';
import '../core/widgets/category widget.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    /*double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;*/

    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Ka",
                style: TextStyle(color: AppPallete.accentColor, fontSize: 25),
              ),
              Icon(
                Icons.import_contacts_sharp,
                color: AppPallete.accentColor,
                size: 30,
              ),
              Text(
                "ar",
                style: TextStyle(color: AppPallete.accentColor, fontSize: 25),
              ),
            ],
          ),
        ),
        leadingWidth: 100,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: .3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Latest",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Text("See all"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Container(
                height: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryWidget('All', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('All'));
                      }),
                      categoryWidget('business', () {
                        print('blossss');
                        context.read<NewsBloc>().add(fetchNewsCategory('business'));
                      }),
                      categoryWidget('entertainment', (){
                        context.read<NewsBloc>().add(fetchNewsCategory('entertainment'));
                      }),
                      categoryWidget('general', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('general'));
                      }),
                      categoryWidget('health', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('health'));
                      }),
                      categoryWidget('science', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('science'));
                      }),
                      categoryWidget('sports', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('sports'));
                      }),
                      categoryWidget('technology', () {
                        context.read<NewsBloc>().add(fetchNewsCategory('technology'));
                      }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsInitial) {
                  context.read<NewsBloc>().add(fetchNewsCategory('All'));
                } else if (state is NewsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.news.articles?.length,
                      itemBuilder: (context, index) {
                        final article = state.news.articles;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(article?[index].urlToImage ?? 'https://via.placeholder.com/100'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 8.0), // Space between image and text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article?[index].title ?? '',
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      article?[index].description ?? '',
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              article?[index].author ?? "",
                                              style: TextStyle(fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            article?[index].publishedAt as String,
                                            style: TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is NewsError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
