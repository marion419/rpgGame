// ignore_for_file: unnecessary_this, prefer_initializing_formals

import 'monster.dart';

class Character {
  String? name;
  int hp=0;
  int atk=0;
  int def=0;

  Character(String name, int hp, int atk, int def){
    this.name=name;
    this.hp=hp;
    this.atk=atk;
    this.def=def;
  }

  // 공격
  void attackMonster(Monster monster){

  }
  // 방어
  void defend(){


  }
  // 상태 표시
  void showStatus(){


  }
}