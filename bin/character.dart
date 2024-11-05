// ignore_for_file: unnecessary_this, prefer_initializing_formals

import 'dart:math';

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
    monster.hp-=atk;
  }
  // 방어
  void defend(int monsterAtk){
    hp+=Random().nextInt(monsterAtk+1);

  }
  // 상태 표시
  void showStatus(){
    print('$name - 체력: $hp, 공격력: $atk, 방어력: $def\n');
  }
}