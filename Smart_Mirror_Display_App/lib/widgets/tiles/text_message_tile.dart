import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= TextMessageTile Class =================================================================
// ===============================================================================================================================

class TextMessageTile extends StatelessWidget {
  // ======================================= Class Variables =====================================================================
  final String text;

  /// The TextMessageTile class simply takes in a string, [text], and displays it within a (Center) widget.
  TextMessageTile(this.text);
  // ======================================= Class Functions =====================================================================

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
