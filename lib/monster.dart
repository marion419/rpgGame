import 'dart:math';
import 'character.dart';

class Monster {
  String? name;
  int hp=0;
  int atk=0;
  int def=0;

  Monster(String this.name, this.hp, int atk, int characterDef){
    this.atk=max(Random().nextInt(atk+1), characterDef);
    def=0;
  }

  void attackCharacter(Character character){
    character.hp-=(atk-character.def);
    print('$name이(가) ${character.name}에게 ${atk-character.def}의 데미지를 입혔습니다.');
  }

  void showStatus(){
    print('$name - 체력: $hp, 공격력: $atk\n');
  }
}