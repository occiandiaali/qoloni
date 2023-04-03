import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qoloni/src/features/feed/presentation/feed_screen.dart';

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
              Icon(Icons.newspaper, size: 150),
              Icon(Icons.person, size: 150),
            ],
          ),
        ));
  }
}
