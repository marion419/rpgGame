// ignore_for_file: unused_import

import 'package:rpg_game/rpg_game.dart' as rpg_game;
import 'character.dart';
import 'monster.dart';
import 'game.dart';
import 'dart:io';

void main() {
  print('캐릭터의 이름을 입력하세요.');
  RegExp reg=RegExp(r'^[a-zA-Z]+$');
  String name;
  while(true){
    name=stdin.readLineSync().toString();
    if(reg.hasMatch(name)){
      break;
    }
    else{
      print('영문 대소문자만 사용할 수 있습니다.');
    }
  }
  print('캐릭터 생성 완료.');
  var game=Game(name);
  game.startGame();
}
