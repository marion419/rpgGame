// ignore_for_file: unused_import

import 'package:rpg_game/rpg_game.dart' as rpg_game;
import 'character.dart';
import 'monster.dart';
import 'game.dart';
import 'dart:io';

void main() {
  // print('캐릭터의 이름을 입력하세요.');
  // RegExp reg=RegExp(r'[a-zA-Z]');
  String name=stdin.readLineSync(/*RegExp(r'[^a-zA-Z]')*/).toString();
  var game=Game(name);
  print(game.character!.name);
}
