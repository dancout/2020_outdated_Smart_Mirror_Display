import 'package:Smart_Mirror_Display_App/widgets/main_display.dart';
import 'package:Smart_Mirror_Display_App/widgets/tile_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This runs the main app
void main() {
  runApp(MyApp());
}

// ===============================================================================================================================
// ======================================= MyApp Class ===========================================================================
// ===============================================================================================================================

// ======================================= Class Functions =====================================================================

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

/// This is the main page of the application.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TileManager(),
        )
      ],
      child: Scaffold(
        body: MainDisplay(),
      ),
    );
  }
}
