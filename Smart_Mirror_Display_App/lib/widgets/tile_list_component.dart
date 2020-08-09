import 'package:Smart_Mirror_Display_App/widgets/tile_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ===============================================================================================================================
// ======================================= TileListComponent Class ===============================================================
// ===============================================================================================================================

class TileListComponent extends StatelessWidget {
  /// This class returns a [Stack] of Tiles, retrieved from the [TileManager].
  TileListComponent();

  // ======================================= Class Functions =====================================================================
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: Provider.of<TileManager>(context, listen: true).myTiles,
    );
  }
}
