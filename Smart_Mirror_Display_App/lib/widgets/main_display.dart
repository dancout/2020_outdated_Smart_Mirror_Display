import 'package:Smart_Mirror_Display_App/widgets/firebase_helper.dart';
import 'package:Smart_Mirror_Display_App/widgets/tile_list_component.dart';
import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= MainDisplay Class =====================================================================
// ===============================================================================================================================

class MainDisplay extends StatelessWidget {
  /// The MainDisplay Class houses the main portion of the Smart_Mirror_Display_App. It returns the [TileListComponent].
  MainDisplay();

  // ======================================= Class Functions =====================================================================
  @override
  Widget build(BuildContext context) {
    // Retrieve data from firebase.
    FirebaseHelper().retrieveDBvalues(context);

    return TileListComponent();
  }
}
