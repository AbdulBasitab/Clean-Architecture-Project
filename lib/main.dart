import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';
import 'package:sample_architecture_project/src/core/global_provider/global_providers.dart';
import 'package:sample_architecture_project/src/features/news/presentation/screens/news_screen.dart';
import 'package:sample_architecture_project/src/features/weather/presentation/screens/weather_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  List<Widget> mainNavigationScreens = [
    const WeatherScreen(),
    const NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationSelectedIndexProvider);
    return MaterialApp(
        theme: AppTheme.darkTheme,
        title: 'Clean Architecture',
        home: SafeArea(
          child: Scaffold(
            body: mainNavigationScreens[selectedIndex],
            bottomNavigationBar: BottomAppBar(
              height: 70,
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.cloud_rounded),
                    label: "Weather",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper_rounded),
                    label: "News",
                  ),
                ],
                currentIndex: selectedIndex,
                onTap: (value) {
                  ref.read(navigationSelectedIndexProvider.notifier).state =
                      value;
                },
                // backgroundColor: Colors.black,
                // selectedItemColor: const Color.fromARGB(255, 8, 78, 135),
                // unselectedItemColor: Colors.white54,
                // unselectedLabelStyle: const TextStyle(
                //   fontSize: 20,
                //   color: Colors.white54,
                // ),
                // selectedLabelStyle: TextStyle(
                //   fontSize: 20,
                //   color: Colors.blue.shade400,
                // ),
              ),
            ),
          ),
        ));
  }
}
