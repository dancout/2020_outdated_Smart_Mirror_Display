import 'package:Smart_Mirror_Display_App/widgets/tiles/generic_tile.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/text_message_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= TileManager Class =====================================================================
// ===============================================================================================================================

/// This ChangeNotifier houses the [List] of [GenericTiles] to be displayed.
class TileManager with ChangeNotifier {
  // ======================================= Class Variables =====================================================================

  List<GenericTile> _myTiles = [
    // TODO: Create a loading progress indicator
    // GenericTile(0, 0, 0.25, 0.25, CircularProgressIndicator(), false)
    GenericTile(0, 0, 0.25, 0.25, TextMessageTile("loading your tiles."), false)
  ];

  // ======================================= Class Functions =====================================================================
  List<GenericTile> get myTiles => _myTiles;

  void setMyTiles(List<GenericTile> incomingTilesList) {
    _myTiles = incomingTilesList;
    notifyListeners();
  }
}
