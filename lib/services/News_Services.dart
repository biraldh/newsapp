import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/NewsModel.dart';

Future<NewsModel> fetchNewsbyCategory(query) async {
  final String apiKey = 'c81831db36174a58be32d2bc28cd6ecf';
  final Uri url = Uri.parse('https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=$apiKey');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);

      return NewsModel.fromJson(data);
    } else {
      log("no");
      throw Exception(response.statusCode);
    }
  } catch (e) {
    log("noo");
    throw Exception(e);
  }
}

