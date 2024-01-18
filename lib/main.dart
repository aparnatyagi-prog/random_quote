import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:random_quote/feature/quote/presentation/screen/quote_screen.dart';
import 'core/util/app_colors.dart';
import 'feature/quote/presentation/bloc/quote_event.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteBloc>(
      create: (context) => QuoteBloc()..add(GetQuoteEvent()),
      child: MaterialApp(
        title: 'Random Quote',
        home:  QuoteScreen(),
        theme: AppThemes.appTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
