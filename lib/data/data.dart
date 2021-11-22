enum ColourType { colourful, bw }

class Colour {
  final String imageUrl;
  final ColourType type;

  Colour({
     this.imageUrl,
     this.type,
  });
}

final allColours = [
  Colour(
    type: ColourType.colourful,
    imageUrl: 'assets/Colour1.png',
  ),
  Colour(
    type: ColourType.bw,
    imageUrl: 'assets/bw1.png',
  ),
  Colour(
    type: ColourType.bw,
    imageUrl: 'assets/bw2.png',
  ),
  Colour(
    type: ColourType.colourful,
    imageUrl: 'assets/Colour2.png',
  ),
  Colour(
    type: ColourType.bw,
    imageUrl: 'assets/bw3.png',
  ),
  Colour(
    type: ColourType.colourful,
    imageUrl: 'assets/Colour3.png',
  ),
];