import 'package:flutter/material.dart';

// ===============================================================================================================================
// ======================================= GenericTile Class =====================================================================
// ===============================================================================================================================

class GenericTile extends StatefulWidget {
  // ======================================= Class Variables =====================================================================

  /// x offset for Align Component
  final double x;

  /// y offset for Align Component
  final double y;

  /// (double) scale for height of tile
  final double heightScale;

  /// (double) scale for width of tile
  final double widthScale;

  /// (widget) to be displayed within the tile
  final Widget tileWidget;

  /// (boolean) on whether to display a border around the tile
  final bool showBorder;

  /// The GenericTile class houses the basic components to create a tile. It stores the x,y offsets, the height,width scales, the
  /// border status, and the actual widget to display within the child.
  GenericTile(this.x, this.y, this.widthScale, this.heightScale,
      this.tileWidget, this.showBorder);

  @override
  _GenericTileState createState() => _GenericTileState();
}

class _GenericTileState extends State<GenericTile> {
  // ======================================= Class Functions =====================================================================
  @override
  Widget build(BuildContext context) {
    return Align(
        // an alternative to Align could be the Positioned Widget
        alignment: Alignment(widget.x, widget.y),
        child: Container(
          decoration: createBorder(),
          child: SizedBox(
            child: widget.tileWidget,
            width: widget.widthScale * MediaQuery.of(context).size.width,
            height: widget.heightScale * MediaQuery.of(context).size.height,
          ),
        ));
  }

  /// This function uses the [showBorder] boolean to determin if a border should be shown.
  /// It then returns a boxDecoration accordingly (null if false).
  BoxDecoration createBorder() {
    return widget.showBorder ? BoxDecoration(border: Border.all()) : null;
  }
}
