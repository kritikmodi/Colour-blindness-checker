import 'package:demo_app_nslhub/data/data.dart';
import 'package:demo_app_nslhub/main.dart';
import 'package:demo_app_nslhub/utils.dart';
import 'package:demo_app_nslhub/widget/draggable_widget.dart';
import 'package:flutter/material.dart';

class DraggableAdvancedPage extends StatefulWidget {
  @override
  _DraggableAdvancedPageState createState() => _DraggableAdvancedPageState();
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  final List<Colour> all = allColours;
  final List<Colour> land = [];
  final List<Colour> air = [];

  final double size = 150;

  void removeAll(Colour toRemove) {
    all.removeWhere((colour) => colour.imageUrl == toRemove.imageUrl);
    land.removeWhere((colour) => colour.imageUrl == toRemove.imageUrl);
    air.removeWhere((colour) => colour.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
      centerTitle: true,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildTarget(
          context,
          text: 'All colours',
          colours: all,
          acceptTypes: ColourType.values,
          onAccept: (data) => setState(() {
            removeAll(data);
            all.add(data);
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTarget(
              context,
              text: 'Colourful',
              colours: land,
              acceptTypes: [ColourType.colourful],
              onAccept: (data) => setState(() {
                removeAll(data);
                land.add(data);
              }),
            ),
            buildTarget(
              context,
              text: 'Black/Gray',
              colours: air,
              acceptTypes: [ColourType.bw],
              onAccept: (data) => setState(() {
                removeAll(data);
                air.add(data);
              }),
            ),
          ],
        ),
      ],
    ),
  );

  Widget buildTarget(
      BuildContext context, {
        @required String text,
        @required List<Colour> colours,
        @required List<ColourType> acceptTypes,
        @required DragTargetAccept<Colour> onAccept,
      }) =>
      CircleAvatar(
        radius: size / 2,
        child: DragTarget<Colour>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...colours
                  .map((colour) => DraggableWidget(colour: colour))
                  .toList(),
              IgnorePointer(child: Center(child: buildText(text))),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              Utils.showSnackBar(
                context,
                text: 'Correct!',
                color: Colors.green,
              );
            } else {
              Utils.showSnackBar(
                context,
                text: 'You might have colour-blindness!',
                color: Colors.red,
              );
            }

            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
        blurRadius: 12,
      )
    ]),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}