import 'package:flutter/material.dart';
import 'package:qoloni/src/features/feed/presentation/feed_screen.dart';

void main() {
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              indicatorColor: Colors.deepOrangeAccent,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.home, size: 34, color: Colors.blueGrey)),
                Tab(icon: Icon(Icons.video_library_rounded, size: 32, color: Colors.blueGrey)),
                Tab(icon: Icon(Icons.shopping_cart, size: 32, color: Colors.blueGrey)),
                Tab(icon: Icon(Icons.notifications, size: 32, color: Colors.blueGrey)),
                Tab(icon: Icon(Icons.account_circle_rounded, size: 32, color: Colors.blueGrey)),
              ],
            ),
            title: const Text('qolony', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
            actions: const [
              Icon(Icons.mic, color: Colors.blueGrey),
              SizedBox(width: 6),
              Icon(Icons.search_rounded, color: Colors.blueGrey),
              SizedBox(width: 15),
            ],
          ),
          body: const TabBarView(
            children: [
              FeedScreen(),
              Icon(Icons.video_camera_back, size: 150),
              Icon(Icons.shopping_cart, size: 150),
              Icon(Icons.notification_important, size: 150),
              Icon(Icons.person, size: 150),
            ],
          ),
        ));
  }
}
