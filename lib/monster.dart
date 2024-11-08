import 'dart:math';
import 'character.dart';

class Monster {
  String? name;
  int hp=0;
  int atk=0;
  int def=0;

  Monster(String this.name, this.hp, int atk, int characterDef){
    this.atk=max(Random().nextInt(atk+1), characterDef+5);
    def=0;
  }

  void attackCharacter(Character character){
    int atkValue=Random().nextInt(5)+atk;
    if(Random().nextInt(100)<15){
      print('크리티컬!!!');
      atkValue*=2;
    }
    character.hp-=(atkValue-character.def);
    print('$name이(가) ${character.name}에게 ${atkValue-character.def}의 데미지를 입혔습니다.\n');
  }

  void showStatus(){
    print('$name - 체력: $hp, 공격력: $atk\n');
  }

  void defUp(){
    def+=2;
    print('$name의 방어력이 증가했습니다.');
  }
}