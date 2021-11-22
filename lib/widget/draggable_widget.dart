import 'package:demo_app_nslhub/data/data.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final Colour colour;

  const DraggableWidget({
    this.colour,
  }) : super(key: null);

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<Colour>(
    data: colour,
    feedback: buildImage(),
    child: buildImage(),
    childWhenDragging: Container(height: size),
  );

  Widget buildImage() => Container(
    height: size,
    width: size,
    child: Image.asset(colour.imageUrl),
  );
}