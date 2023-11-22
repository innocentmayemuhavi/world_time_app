import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/filter.dart';
import 'package:world_time_app/pages/home_screen.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const ChooseLocation(),
          '/filter': (context) => const FilterScreen()
        },
      ),
    );
