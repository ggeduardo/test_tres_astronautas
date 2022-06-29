import 'package:flutter/material.dart';

class Slot {
  Slot({this.animationController, this.color, this.isActive, this.position});

  Color? color;
  bool? isActive;
  Position? position;
  AnimationController? animationController;

  factory Slot.fromMap(Map<String, dynamic> map) => Slot(
        color: map["color"],
        isActive: map["isActive"],
        animationController: map["controller"],
        position: Position.fromMap(map["coordenadas"]),
      );
}

class Position {
  Position({this.i, this.j});

  int? i;
  int? j;

  factory Position.fromMap(Map<String, dynamic> map) =>
      Position(i: map["i"], j: map["j"]);
}
