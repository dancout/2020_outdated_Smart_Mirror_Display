import 'package:Smart_Mirror_Display_App/widgets/tile_manager.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/generic_tile.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/image_tile.dart';
import 'package:Smart_Mirror_Display_App/widgets/tiles/text_message_tile.dart';
import 'package:flutter/material.dart';
import 'package:Smart_Mirror_Display_App/globals.dart';
import 'package:provider/provider.dart';

// ===============================================================================================================================
// ======================================= TileListComponent Class ===============================================================
// ===============================================================================================================================

/// This class is to trigger the call to firebase to retrieve entry data & to
/// build the [GenericTile] List from these entries.
class FirebaseHelper {
  // ======================================= Class Functions =====================================================================

  /// This function takes in a [dynamic] entry from the Firebase DB and converts it into
  /// a usable [GenericTile] to be displayed.
  GenericTile createTile(dynamic entry) {
    // Pull generic entry data about the tile
    double x = entry['x'];
    double y = entry['y'];
    double widthScale = entry['widthScale'];
    double heightScale = entry['heightScale'];
    bool showBorder = entry['showBorder'];

    Widget tileWidget;

    // Determine the Tile Type
    if (entry['tile_type'] == "TextMessageTile") {
      tileWidget = TextMessageTile(entry['text']);
    } else if (entry['tile_type'] == "ImageTile") {
      tileWidget = ImageTile(entry['url']);
    } else {
      // TODO: Implement an actual Logger here
      print('received an unexpected tile_type.');
    }

    return GenericTile(x, y, widthScale, heightScale, tileWidget, showBorder);
  }

  /// This function retrieves entries from the Firebase DB. These entries will
  /// then be set as the [List<GenericTile>] Tilelist.
  void retrieveDBvalues(BuildContext context) {
    List<GenericTile> tileList = [];

    db.ref('users/DanielCouturier').once('value').then((value) {
      var snap = value.snapshot;
      var snapVal = snap.val();

      for (dynamic entry in snapVal['tiles']) {
        GenericTile incomingTile = createTile(entry);
        tileList.add(incomingTile);
      }

      Provider.of<TileManager>(context, listen: false).setMyTiles(tileList);
    }).catchError((error) {
      print(error);
    });
  }
}
