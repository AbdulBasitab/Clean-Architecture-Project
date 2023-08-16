import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: customTextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
