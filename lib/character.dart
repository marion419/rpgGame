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
    print('$name이(가) ${monster.name}에게 $atk의 데미지를 입혔습니다.');
  }
  // 방어
  void defend(){
    hp+=Random().nextInt(def-(def~/3)+1)+(def~/3);
  }
  // 아이템 사용
  void attackWithItem(Monster monster, bool item){
    monster.hp-=atk*2;
    print('$name이(가) ${monster.name}에게 ${atk*2}의 데미지를 입혔습니다.');
  }
  // 상태 표시
  void showStatus(){
    print('$name - 체력: $hp, 공격력: $atk, 방어력: $def\n');
  }
}