import 'package:Smart_Mirror_Display_App/widgets/tiles/generic_tile.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/image_tile.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/text_message_tile.dart';
import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= GenericTile Class =====================================================================
// ===============================================================================================================================

class MainDisplay extends StatefulWidget {
  /// The MainDisplay Class houses the main portion of the Smart_Mirror_Display_App. It provides the Scaffold & body.
  MainDisplay();

  @override
  _MainDisplayState createState() => _MainDisplayState();
}

class _MainDisplayState extends State<MainDisplay> {
  // ======================================= Class Functions =====================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // These children represent the list of tiles to display
        children: [
          GenericTile(
              -1.0,
              -0.5,
              .25,
              .35,
              ImageTile(
                  'https://secure.img1-fg.wfcdn.com/im/32014973/resize-h800%5Ecompr-r85/4307/43074606/Sitting+Sleepy+Bulldog+Puppy+Statue.jpg'),
              false),
          GenericTile(
              0.0, 0.0, .20, .33, TextMessageTile("Sample Square"), true),
          GenericTile(
              1.0, 0.0, .25, .95, TextMessageTile("Sample Vertical"), true),
        ],
      ),
    );
  }
}
