import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoloni/src/features/news/data/repos/repository.dart';
//import 'package:qoloni/src/features/news/presentation/bloc/bloc.dart';
//import 'package:qoloni/src/features/news/presentation/ui/news_articles.dart';
import 'package:qoloni/src/features/feed/presentation/feed_screen.dart';
import 'package:qoloni/src/features/news/presentation/ui/news_ui.dart';

void main() {
  // Set status bar colour to white in all screens
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qolony',
      theme: ThemeData(
      //  primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 // const MyHomePage({super.key, required this.title});

 // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isActive = true;
  Color tabIconColour = Colors.blueGrey;
  Color activeIconColour = Colors.deepOrangeAccent;
  int selectedIndex = 0;

  void changIconColour(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              onTap: changIconColour,
              indicatorColor: Colors.deepOrangeAccent,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.home, size: 34, color: selectedIndex == 0 ? activeIconColour : tabIconColour)),
                Tab(icon: Icon(Icons.video_library_rounded, size: 32, color: selectedIndex == 1 ? activeIconColour : tabIconColour)),
                Tab(icon: Icon(Icons.shopping_cart, size: 32, color: selectedIndex == 2 ? activeIconColour : tabIconColour)),
                Tab(icon: Icon(Icons.newspaper_rounded, size: 32, color: selectedIndex == 3 ? activeIconColour : tabIconColour)),
                Tab(icon: Icon(Icons.account_circle_rounded, size: 32, color: selectedIndex == 4 ? activeIconColour : tabIconColour)),
              ],
            ),
            title: const Text('qolony', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
            actions: [
              if (selectedIndex == 0) const Icon(Icons.mic, color: Colors.blueGrey),
              const SizedBox(width: 6),
              if (selectedIndex == 1) const Icon(Icons.add_a_photo_outlined, color: Colors.blueGrey),
              const SizedBox(width: 6),
              if (selectedIndex == 2) const Icon(Icons.create_outlined, color: Colors.blueGrey),
              const SizedBox(width: 6),
              if (selectedIndex == 3) const Icon(Icons.search_rounded, color: Colors.blueGrey),
              const SizedBox(width: 6),
              if (selectedIndex == 3) const Icon(Icons.more_vert, color: Colors.blueGrey),
              const SizedBox(width: 15),
            ],
          ),
          body: TabBarView(
            children: [
              const FeedScreen(),
              const Icon(Icons.video_camera_back, size: 150),
              const Icon(Icons.shopping_cart, size: 150),
              //NewsUI(),
              //Icon(Icons.newspaper, size: 150),
              RepositoryProvider(
                create: (context) => NewsRepo(),
                child: const NewsUI(),
              ),
              // BlocProvider(
              //   create: (context) => NewsBloc(),
              //   child: const NewsArticles(),
              // ),
              const Icon(Icons.person, size: 150),
            ],
          ),
        ));
  }
}
