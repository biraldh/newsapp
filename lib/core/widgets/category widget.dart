import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget categoryWidget(String category, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: GestureDetector(
      child: Text(category),
      onTap: onTap,
    ),
  );
}