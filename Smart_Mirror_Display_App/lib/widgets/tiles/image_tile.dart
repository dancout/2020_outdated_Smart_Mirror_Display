import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= ImageTile Class =======================================================================
// ===============================================================================================================================

class ImageTile extends StatelessWidget {
  // ======================================= Class Variables =====================================================================
  final String url;

  /// The ImageTile class simply takes in a string, [url], and displays the image found at that url.
  ImageTile(this.url);

  // ======================================= Class Functions =====================================================================
  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(this.url));
  }
}
