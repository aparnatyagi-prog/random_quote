import 'package:flutter/material.dart';

class QuoteErrorWidget extends StatelessWidget {
  final String errorMessage;
  const QuoteErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
