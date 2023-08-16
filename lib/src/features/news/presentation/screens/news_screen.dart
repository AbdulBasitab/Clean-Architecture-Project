import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: customTextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
